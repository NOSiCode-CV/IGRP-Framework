console.log("--------load JS signerCanvas loaded ------");

try {
    const controls = document.querySelector('.controls');
    if (controls) controls.style.position = 'relative';

    document.addEventListener('click', function(event) {
        markClickPoint(event);
    });

    function markClickPoint(event) {
        const canvas    = document.getElementById('canvas_frame');
        const signature = document.getElementById('signature_holder');
        if (!canvas || !signature) return;

        if (
            event.target.closest('.IGRP_vkboard') ||
            event.target.closest('.vkb_geral') ||
            event.target.closest('.vkb_input') ||
            event.target.closest('.vkb_ctrl')
        ) {
            return;
        }

        // 🛑 Prevent repositioning when clicking on the signature holder itself
        if (signature.contains(event.target)) {
            return;
        }

        const controls     = canvas.parentElement;
        controls.style.position = 'relative';

        const rect         = canvas.getBoundingClientRect();
        const controlsRect = controls.getBoundingClientRect();

        // ✅ Dimensions matching the new styled signature block
        const signatureWidth  = 160;
        const signatureHeight = 60;

        const clickX = event.clientX - rect.left;
        const clickY = event.clientY - rect.top;

        if (clickX < 0 || clickX > rect.width || clickY < 0 || clickY > rect.height) return;

        // Center signature box on click, clamped to canvas edges
        const posX = Math.min(Math.max(clickX - signatureWidth  / 2, 0), rect.width  - signatureWidth);
        const posY = Math.min(Math.max(clickY - signatureHeight / 2, 0), rect.height - signatureHeight);

        const canvasInControlsTop  = rect.top  - controlsRect.top;
        const canvasInControlsLeft = rect.left - controlsRect.left;

        signature.style.display  = 'block';
        signature.style.position = 'absolute';
        signature.style.left     = `${canvasInControlsLeft + posX}px`;
        signature.style.top      = `${canvasInControlsTop  + posY}px`;

        canvas.dataset.signX = posX.toString();
        canvas.dataset.signY = posY.toString();

        console.log('Click:', { posX, posY, canvasInControlsTop, canvasInControlsLeft });
    }

} catch (error) {
    console.error("Erro no signerCanvas:", error);
}

window.onload = function() {
    console.log("--------window.onload ------");
};