
   $(document).ready(function() {
    var slider = $("#the_slider").slider({
        range: true,
        min: 200,
        max: 500,
        values: [250, 450],
        slide: function(event, ui) {
            $("#data1").val(ui.values[0]);
            $("#data2").val(ui.values[1]);
        }
    });
    $("#data1").val(slider.slider("values")[0]);
    $("#data2").val(slider.slider("values")[1]);
});

