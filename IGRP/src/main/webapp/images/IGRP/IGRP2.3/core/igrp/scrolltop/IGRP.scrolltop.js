(function(){
    var pending = false;

    function updateVisibility() {
        pending = false;
        var button = document.getElementById('igrp-go-up');
        if (!button) return;
        var top = typeof window.pageYOffset === 'number' ? window.pageYOffset : document.documentElement.scrollTop;
        var display = top > 300 ? 'inline-block' : 'none';
        if (button.style.display !== display) button.style.display = display;
    }

    function scheduleVisibility() {
        if (pending) return;
        pending = true;
        window.requestAnimationFrame(updateVisibility);
    }

    $.IGRP.targets.scroll_to_top = {
        label: 'Scroll To Top',
        action: function(){
            $('html').animate({scrollTop: '0px'}, 350);
            return false;
        }
    };

    window.addEventListener('scroll', scheduleVisibility, {passive: true});
    $.IGRP.on('init', scheduleVisibility);
})();
