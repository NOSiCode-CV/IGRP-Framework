(function ($) {
    "use strict";

    // This set of validators requires the File API, so if we'ere in a browser
    // that isn't sufficiently "HTML5"-y, don't even bother creating them.  It'll
    // do no good, so we just automatically pass those tests.
    var is_supported_browser = !!window.File,
        fileSizeToBytes,
        formatter = $.validator.format;

    /**
     * Converts a measure of data size from a given unit to bytes.
     *
     * @param number size
     *   A measure of data size, in the give unit
     * @param string unit
     *   A unit of data.  Valid inputs are "B", "KB", "MB", "GB", "TB"
     *
     * @return number|bool
     *   The number of bytes in the above size/unit combo.  If an
     *   invalid unit is specified, false is returned
     */
    fileSizeToBytes = (function () {

        var units = ["B", "KB", "MB", "GB", "TB"];

        return function (size, unit) {

            var index_of_unit = units.indexOf(unit),
                coverted_size;

            if (index_of_unit === -1) {

                coverted_size = false;

            } else {

                while (index_of_unit > 0) {
                    size *= 1024;
                    index_of_unit -= 1;
                }

                coverted_size = size;
            }

            return coverted_size;
        };
    }());

    /**
     * Validates that an uploaded file is of a given file type, tested
     * by it's reported mime string.
     *
     * @param obj params
     *   An optional set of configuration parmeters.  Supported options are:
     *    "types" : array (default ["text"])
     *      An array of file types.  This types are loosely checked, so including
     *      "text" in this array of types will cause "text/plain" and "text/css"
     *      to both be excepted.  If the selected file matches any of the strings
     *      in this array, validation passes.
     */
    $.validator.addMethod(
        "fileType",
        function (value, element, params) {

            var files,
                types = params.types || ["text"],
                is_valid = false;

            if (!is_supported_browser || this.optional(element)) {

                is_valid = true;

            } else {

                files = element.files;

                if (files.length < 1) {

                    is_valid = false;

                } else {

                    $.each(types, function (key, value) {
                        is_valid = is_valid || files[0].type.indexOf(value) !== -1;
                    });

                }
            }

            return is_valid;
        },
        function (params, element) {
            return formatter(
                "O arquivo deve ser um dos seguintes tipos: {0}.",
                params.types.join(",")
            );
        }
    );

    /**
     * Validates that a file selected for upload is at least a given
     * file size.
     *
     * @param obj params
     *   An optional set of configuration parameters.  Supported options are:
     *     "unit" : string (default "KB")
     *       The unit of measure of the file size limit is in.  Valid inputs
     *       are "B", "KB", "MB" and "GB"
     *     "size" : number (default 100)
     *        The minimum size of the file, in the above units, that the file
     *        must be, to be accepted as "valid"
     */
    $.validator.addMethod(
        "minFileSize",
        function (value, element, params) {

            var files,
                unit = params.unit || "KB",
                size = params.size || 100,
                min_file_size = fileSizeToBytes(size, unit),
                is_valid = false;

            if (!is_supported_browser || this.optional(element)) {

                is_valid = true;

            } else {

                files = element.files;

                if (files.length < 1) {

                    is_valid = false;

                } else {

                    is_valid = files[0].size >= min_file_size;

                }
            }

            return is_valid;
        },
        function (params, element) {
            return formatter(
                "O arquivo deve ter pelo menos {0}{1} de tamanho.",
                [params.size || 100, params.unit || "KB"]
            );
        }
    );

    /**
     * Validates that a file selected for upload is no loarger than a given
     * file size.
     *
     * @param obj params
     *   An optional set of configuration parameters.  Supported options are:
     *     "unit" : string (default "KB")
     *       The unit of measure of the file size limit is in.  Valid inputs
     *       are "B", "KB", "MB" and "GB"
     *     "size" : number (default 100)
     *        The maximum size of the file, in the above units, that the file
     *        can be to be accepted as "valid"
     */
    $.validator.addMethod(
        "maxFileSize",
        function (value, element, params) {

            var files,
                unit = params.unit || "KB",
                size = params.size || 100,
                max_file_size = fileSizeToBytes(size, unit),
                is_valid = false;

            if (!is_supported_browser || this.optional(element)) {

                is_valid = true;

            } else {

                files = element.files;

                if (files.length < 1) {

                    is_valid = false;

                } else {

                    is_valid = files[0].size <= max_file_size;

                }
            }

            return is_valid;
        },
        function (params, element) {
            return formatter(
                "O arquivo não pode ser maior que {0}{1}.",
                [params.size || 100, params.unit || "KB"]
            );
        }
    );

}(jQuery));