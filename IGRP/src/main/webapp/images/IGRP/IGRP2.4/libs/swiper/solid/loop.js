import { template as _$template } from "solid-js/web";
import { effect as _$effect } from "solid-js/web";

const _tmpl$ = /*#__PURE__*/_$template(`<div></div>`, 2);

import Swiper from 'swiper';

function calcLoopedSlides(slides, swiperParams) {
  let slidesPerViewParams = swiperParams.slidesPerView;

  if (swiperParams.breakpoints) {
    const breakpoint = Swiper.prototype.getBreakpoint(swiperParams.breakpoints);
    const breakpointOnlyParams = breakpoint in swiperParams.breakpoints ? swiperParams.breakpoints[breakpoint] : undefined;

    if (breakpointOnlyParams && breakpointOnlyParams.slidesPerView) {
      slidesPerViewParams = breakpointOnlyParams.slidesPerView;
    }
  }

  let loopedSlides = Math.ceil(parseFloat(swiperParams.loopedSlides || slidesPerViewParams, 10));
  loopedSlides += swiperParams.loopAdditionalSlides;

  if (loopedSlides > slides.length && swiperParams.loopedSlidesLimit) {
    loopedSlides = slides.length;
  }

  return loopedSlides;
}

function renderLoop(swiper, slides, swiperParams) {
  const modifiedSlides = slides.map((child, index) => {
    const node = child.cloneNode(true);
    node.swiper = swiper;
    node['data-swiper-slide-index'] = index;
    return node;
  });

  function duplicateSlide(child, index, position) {
    const node = child.cloneNode(true);
    node.key = `${child.key}-duplicate-${index}-${position}`;
    node.className = `${child.className || ''} ${swiperParams.slideDuplicateClass}`;
    return node;
  }

  if (swiperParams.loopFillGroupWithBlank) {
    const blankSlidesNum = swiperParams.slidesPerGroup - modifiedSlides.length % swiperParams.slidesPerGroup;

    if (blankSlidesNum !== swiperParams.slidesPerGroup) {
      for (let i = 0; i < blankSlidesNum; i += 1) {
        const blankSlide = // eslint-disable-next-line react/react-in-jsx-scope
        (() => {
          const _el$ = _tmpl$.cloneNode(true);

          _$effect(() => _el$.className = `${swiperParams.slideClass} ${swiperParams.slideBlankClass}`);

          return _el$;
        })();

        modifiedSlides.push(blankSlide);
      }
    }
  }

  if (swiperParams.slidesPerView === 'auto' && !swiperParams.loopedSlides) {
    swiperParams.loopedSlides = modifiedSlides.length;
  }

  const loopedSlides = calcLoopedSlides(modifiedSlides, swiperParams);
  const prependSlides = [];
  const appendSlides = [];

  for (let i = 0; i < loopedSlides; i += 1) {
    const index = i - Math.floor(i / modifiedSlides.length) * modifiedSlides.length;
    appendSlides.push(duplicateSlide(modifiedSlides[index], i, 'append'));
    prependSlides.unshift(duplicateSlide(modifiedSlides[modifiedSlides.length - index - 1], i, 'prepend'));
  }

  if (swiper) {
    swiper.loopedSlides = loopedSlides;
  }

  return [...prependSlides, ...modifiedSlides, ...appendSlides];
}

export { calcLoopedSlides, renderLoop };