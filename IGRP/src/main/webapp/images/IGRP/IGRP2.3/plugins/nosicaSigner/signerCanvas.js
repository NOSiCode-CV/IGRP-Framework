console.log("--------load JS signerCanvas loaded ------");

try {
    // Ensure the controls container is the positioning anchor
    const controls = document.querySelector('.controls');
    if (controls) controls.style.position = 'relative';

    document.addEventListener('click', function (event) {
        markClickPoint(event);
    });

function markClickPoint(event) {
    const canvas    = document.getElementById('canvas_frame');
    const signature = document.getElementById('signature_holder');

    if (!canvas || !signature) return;

    // ✅ Force .controls to be the positioning anchor
    const controls = canvas.parentElement;
    controls.style.position = 'relative';

    const rect            = canvas.getBoundingClientRect();
    const controlsRect    = controls.getBoundingClientRect();
    const signatureWidth  = 160;
    const signatureHeight = 80;

    const clickX = event.clientX - rect.left;
    const clickY = event.clientY - rect.top;

    if (clickX < 0 || clickX > rect.width || clickY < 0 || clickY > rect.height) return;

    const posX = Math.min(Math.max(clickX, 0), rect.width  - signatureWidth);
    const posY = Math.min(Math.max(clickY, 0), rect.height - signatureHeight);

    // ✅ Offset by canvas position inside .controls
    const canvasInControlsTop  = rect.top  - controlsRect.top;
    const canvasInControlsLeft = rect.left - controlsRect.left;

    signature.style.display  = 'flex';
    signature.style.position = 'absolute';
    signature.style.left     = `${canvasInControlsLeft + posX}px`;
    signature.style.top      = `${canvasInControlsTop  + posY}px`;

    canvas.dataset.signX = posX;
    canvas.dataset.signY = posY;

    console.log('Click:', { posX, posY, canvasInControlsTop, canvasInControlsLeft });
}

} catch (error) {
    console.error("Erro no signerCanvas:", error);
}

window.onload = function () {
    console.log("--------window.onload ------");
};