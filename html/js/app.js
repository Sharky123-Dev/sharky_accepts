$(document).ready(function () {
    window.addEventListener('message', function (event){
        var data = event.data;
        if(data.action === "open") {
            new Noty({
                type: 'success',
                layout: 'topRight',
                text: data.text + "",
                theme: 'metroui',
                animation: {
                    open: 'animated bounceInRight', // Animate.css class names
                    close: 'animated bounceOutRight' // Animate.css class names
                },
                timeout: data.time,
                progressBar: true
            }).show();
        }
    })
});