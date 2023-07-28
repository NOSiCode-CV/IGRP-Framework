<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template mode="igrp-carousel-2" name="igrp-carousel-2" match="*">
        <xsl:param name="id" select="''"/>
        <div id="{$id}" class="carousel slide" data-bs-ride="carousel">
            
            <ol class="carousel-indicators">
                <li data-bs-target="#{$id}" data-bs-slide-to="0" class=""></li>
                <li data-bs-target="#{$id}" data-bs-slide-to="1" class=""></li>
                <li data-bs-target="#{$id}" data-bs-slide-to="2" class="active" aria-current="true"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="carousel-item">
                    <img class="d-block img-fluid mx-auto" src="https://placehold.co/1200x400" alt="First slide"/>
                </div>
                <div class="carousel-item">
                    <img class="d-block img-fluid mx-auto" src="https://placehold.co/1200x400" alt="Second slide"/>
                </div>
                <div class="carousel-item active">
                    <img class="d-block img-fluid mx-auto" src="https://placehold.co/1200x400" alt="Third slide"/>
                </div>
            </div>

            <a class="carousel-control-prev" href="#{$id}" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#{$id}" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

        </div>
    </xsl:template>

</xsl:stylesheet>