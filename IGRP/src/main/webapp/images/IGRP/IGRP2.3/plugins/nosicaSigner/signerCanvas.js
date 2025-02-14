console.log("--------load JS signerCanvas loded ------");
try {
    document.addEventListener('click', function (event) {
        markClickPoint(event);
    });
    function markClickPoint(event) {
        const canvas = document.getElementById('canvas_frame');
        const signature = document.getElementById('signature_holder');
        const rect = canvas.getBoundingClientRect();        
        const signatureWidth = 200;
        const signatureHeight = 60;     
        
        const realWidth = canvas.width;
        const realHeight = canvas.height;

        const displayWidth = rect.width;
        const displayHeight = rect.height;

            
        const scaleX = realWidth / displayWidth;
        const scaleY = realHeight / displayHeight;

        // Calcula as coordenadas do clique dentro do canvas
        const clickX = (event.clientX - rect.left) * scaleX;
        const clickY = (event.clientY - rect.top) * scaleY;

        // Ajusta para a escala do PDF e transforma o ponto de clique para o sistema de coordenadas do PDF
        const adjustedX = clickX / scaleX
        const adjustedY = displayHeight - (clickY / scaleY);

        const context = canvas.getContext('2d');

        // console.log("displayHeight - adjustedY)",displayHeight - adjustedY)
        // console.log("realHeight - adjustedY)",realHeight - adjustedY)

        
        context.strokeStyle = 'red';
        context.lineWidth = 2;

        if(adjustedX >=0 &&
            adjustedX <= displayWidth - signatureWidth   &&
            adjustedY >= signatureHeight  &&
            adjustedY <= displayHeight
            )
        {            
            console.log('Coordenadas ajustadas do clique:', {
                x: adjustedX,
                y: adjustedY,
                
            });
            signature.style.display = `flex`;
            console.log("\n---------------")

            signature.style.left = `${adjustedX}px`;
            signature.style.top = `${840 - adjustedY}px`;
            signature.style.position = `absolute`;     
            signature.style.border = `1px solid black`;
            console.log("signature",signature)

            sendClickDataToAPI(adjustedX, adjustedY);
        }

    }
}

catch (error) {
    console.error("Erro antes do DOMContentLoaded:", error);
}
window.onload = function () {
    console.log("--------window.onload ------");
}