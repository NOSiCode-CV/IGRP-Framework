(function () {

    const selectorInputFlag = '[data-input-flag]';
    const selectorCountryFlagImg = '.country-flagimg';
    const selectorOptionsFlagImg = '.options-flagimg';
    const selectorDropdownMenu = '.dropdown-menu';
    const selectorDropdownMenuList = '.dropdown-menu-list';
    const selectorCountryListCodeNo = '.countrylist-codeno';
    const selectorCountryName = '.country-name';
    const selectorFlagInput = '.flag-input';
    const selectorSearchCountryList = '.search-countryList';

    $.IGRP.component('flagSelector', {

        list: {},
        countryListData: null,

        get: (id) => {
            return $.IGRP.components.flagSelector.list[id];
        },

        init: (parent = null) => {

            const elements = parent
                ? parent.find(selectorInputFlag)
                : $(selectorInputFlag);

            const updateQuantity = (element) => {
                console.log('Quantity updated for', element);
            };

            const initializeDropdown = (element) => {
                const countryFlagImg = element.querySelector(selectorCountryFlagImg);
                const dropdownMenuItems = element.querySelectorAll(`${selectorDropdownMenu} li`);
                const flagInputElements = document.querySelectorAll('[data-option-flag-img-name]');
                const optionFlagNameElements = document.querySelectorAll('[data-option-flag-name]');

                let initialFlagSrc = "";
                if (countryFlagImg) {
                    initialFlagSrc = countryFlagImg.getAttribute('src');
                }

                dropdownMenuItems.forEach(item => {
                    const optionFlagImg = item.querySelector(selectorOptionsFlagImg).getAttribute('src');
                    item.addEventListener('click', () => {
                        const countryCode = item.querySelector(selectorCountryListCodeNo).innerHTML;
                        const button = element.querySelector('button');
                        if (button) {
                            button.querySelector('img').setAttribute('src', optionFlagImg);
                            button.querySelector('span').innerHTML = countryCode;
                        }
                    });
                    if (initialFlagSrc === optionFlagImg) {
                        item.classList.add('active');
                    }
                });

                flagInputElements.forEach(flagInputElement => {
                    const flagInput = flagInputElement.querySelector(selectorFlagInput);
                    const backgroundImage = getComputedStyle(flagInput).backgroundImage;
                    const imageSrc = backgroundImage.substring(backgroundImage.indexOf("/as") + 1, backgroundImage.lastIndexOf('"'));
                    flagInputElement.querySelectorAll(`${selectorDropdownMenu} li`).forEach(item => {
                        const optionFlagImg = item.querySelector(selectorOptionsFlagImg).getAttribute('src');
                        item.addEventListener('click', () => {
                            const countryName = item.querySelector(selectorCountryName).innerHTML;
                            flagInput.style.backgroundImage = `url(${optionFlagImg})`;
                            flagInput.value = countryName;
                        });
                        if (imageSrc === optionFlagImg) {
                            item.classList.add('active');
                            flagInput.value = item.querySelector(selectorCountryName).innerHTML;
                        }
                    });
                });

                optionFlagNameElements.forEach(optionFlagNameElement => {
                    const flagInput = optionFlagNameElement.querySelector(selectorFlagInput);
                    const initialCountryName = flagInput.value;
                    optionFlagNameElement.querySelectorAll(`${selectorDropdownMenu} li`).forEach(item => {
                        const countryName = item.querySelector(selectorCountryName).innerHTML;
                        item.addEventListener('click', () => {
                            flagInput.value = countryName;
                        });
                        if (initialCountryName === countryName) {
                            item.classList.add('active');
                            flagInput.value = countryName;
                        }
                    });
                });
            };

            const fetchCountryList = () => {
                const xhr = new XMLHttpRequest();
                xhr.open("GET", "../../../assets/json/country-list.json", true);
                xhr.responseType = "json";
                xhr.onload = () => {
                    const status = xhr.status;
                    if (status === 200) {
                        $.IGRP.components.flagSelector.countryListData = xhr.response;
                        const elements = document.querySelectorAll(selectorInputFlag);
                        elements.forEach(element => {
                            populateDropdown(element, xhr.response);
                            initializeDropdown(element);
                        });
                    } else {
                        console.log("Something went wrong: " + status);
                    }
                };
                xhr.send();
            };

            const populateDropdown = (element, data) => {
                let dropdownHtml = '';
                data.forEach(country => {
                    dropdownHtml += `
                        <li class="dropdown-item d-flex">
                            <div class="flex-shrink-0 me-2">
                                <img src="${country.flagImg}" alt="country flag" class="options-flagimg" height="20">
                            </div>
                            <div class="flex-grow-1">
                                <div class="d-flex">
                                    <div class="country-name me-1">${country.countryName}</div>
                                    <span class="countrylist-codeno text-muted">${country.countryCode}</span>
                                </div>
                            </div>
                        </li>`;
                });
                const dropdownMenuList = element.querySelector(selectorDropdownMenuList);
                dropdownMenuList.innerHTML = dropdownHtml;
            };

            const handleSearch = (inputElement) => {
                const searchValue = inputElement.value.toLowerCase();
                const filteredData = $.IGRP.components.flagSelector.countryListData.filter(country => {
                    return country.countryName.toLowerCase().includes(searchValue) || country.countryCode.includes(searchValue);
                });

                const parentElement = inputElement.closest(selectorInputFlag);
                populateDropdown(parentElement, filteredData);
                initializeDropdown(parentElement);
            };

            elements.each(function () {
                const searchInput = $(this).find(selectorSearchCountryList);
                if (searchInput.length) {
                    searchInput.on('keyup', function () {
                        handleSearch(this);
                    });
                }
            });

            fetchCountryList();
        }

    }, true);

})();
