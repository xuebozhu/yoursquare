$(function(){
    // GLOBAL VARIABLES
    var selectedElement = null;

    /* Funcionalidad para colapsar los elementos*/
    $(".header-collapse").click(function(event){
      var elem = event.target;
      if($(elem).find(".collapse-hide").length > 0){
        $(elem).find(".collapse-hide").html("&#8593;");
        $(elem).find(".collapse-hide").addClass("collapse-show");
        $(elem).find(".collapse-hide").removeClass("collapse-hide");
      }else{
        $(elem).find(".collapse-show").html("&#8595;");
        $(elem).find(".collapse-show").addClass("collapse-hide");
        $(elem).find(".collapse-show").removeClass("collapse-show");
      }
      $(elem).parent().find(".items").toggle();
    });

    var drake = dragula({
      copy: true
    }).on('drop', function (el) {
      $(el).addClass("draggable");
      new Medium({
          element: el,
          mode: Medium.partialMode
      });
    });

    // contenedores de los elentos arrastrables
    drake.containers.push(document.querySelector("#items-p"));
    drake.containers.push(document.querySelector("#items"));
    drake.containers.push(document.querySelector("#dropzone"));

    // cuando se realiza un doble click para editarlo
    interact('.draggable').on('doubletap', function (event) {
      $(event.target).focus();
      $(event.target).removeClass("draggable");
      $(event.target).focusout(function(){
        $(event.target).addClass("draggable");
        resetTools();
      })
      event.preventDefault();
    });

    function resetTools(){
      $("#fuente-font-text").val("Arial");
      $("#range-size").val("16");
      $("#color-style").val("#ffffff");
    }


    // seleccionar el elemento de dropzone
    interact('.draggable').on('tap', function (event) {
      selectedElement = event.target;
      event.preventDefault();
    });


    // para cambiar el tipo de letra
    $("#fuente-font-text").change(function(event){
      console.log(this.value);
      $(selectedElement).css("font-family",this.value);
    });

    // para cambiar el tamaño de letra
    $("#range-size").change(function(event){
      $(selectedElement).css("font-size",event.target.value+"px");
    });
    // para cambiar el color de letra
    $("#color-style").change(function(event){
      $(selectedElement).css("color",event.target.value);
    });

    // para cambiar el fondo
    $("#fondo-background-square").change(function(event){
      $("#wrapper-square").attr("class",this.value);
    });

    // para reiniciar las herramientas
    $("#resetTools").click(function(){
    // resetTools();
        html2canvas(document.getElementById("wrapper-square"), {
            onrendered: function(canvas) {
              var img = canvas.toDataURL("image/png");
              // document.body.appendChild(canvas);
              $.ajax({
                url:"../mode/saveThumb.php",
                type:"POST",
                data: {"image":img},
                success: function(data){
                  alert("perfecto");
                },
                error: function(x,h,r){
                  alert("problem");
                }
              });

            //window.open(canvas.toDataURL("image/png"));
            }
        });
    });

});
