
var curstep = 2;
function hidep(side){

    if ((side != "left")&&(side != "right")){
        if (curstep == side) {
        }
        else
        if (side == (curstep + 1)) {
            hidep2("right");
        }
        else
        if (side == (curstep + 2)) {
            hidep2("right");
            hidep2("right");
        }
        else
        if (side == (curstep - 1)) {
            hidep2("left");
        }
        else
        if (side == (curstep - 2)) {
            hidep2("left");
            hidep2("left");
        }
    }
}

function hidep2(side){
    if (side == "left") {
        if (curstep != 1) {
            if (curstep == 3) {


                $("#right").animate({
                    marginLeft: "922px"
                }, 400);

                $("#header-slider").animate({
                    marginLeft: "315px"
                }, 400);

                $("#arrowUpBlack").animate({
                    marginLeft: "463px"
                }, 600);
            }
            else if (curstep == 2) {
                $("#header-slider").animate({
                    marginLeft: "0px"
                }, 400);

                $("#arrowUpBlack").animate({
                    marginLeft: "150px"
                }, 600);
            }
            $("#image" + curstep).fadeOut("slow");



            document.getElementById("step" + curstep).style.backgroundPosition = '22px 0px';
            document.getElementById("step" + curstep).className = "steps";
            curstep--;
            document.getElementById("step" + curstep).style.backgroundPosition = '22px -37px';




            if (curstep == 1) {
                $("#left").animate({
                    marginLeft: "0px"
                }, 400);
            }
            document.getElementById("step" + curstep).className = "stepSelected";
        }
    }
    else if (side == "right") {
        if (curstep != 3) {
            if (curstep == 1) {
                $("#left").animate({
                    marginLeft: "-33px"
                }, 400);


                $("#header-slider").animate({
                    marginLeft: "315px"
                }, 400);

                $("#arrowUpBlack").animate({
                    marginLeft: "463px"
                }, 600);
            }
            else
            if (curstep == 2) {


                $("#header-slider").animate({
                    marginLeft: "625px"
                }, 400);

                $("#arrowUpBlack").animate({
                    marginLeft: "780px"
                }, 600);

            }



            document.getElementById("step" + curstep).style.backgroundPosition = '22px 0px';
            document.getElementById("step" + curstep).className = "steps";
            curstep++;
            document.getElementById("step" + curstep).className = "stepSelected";
            document.getElementById("step" + curstep).style.backgroundPosition = '22px -37px';



            $("#image" + curstep).fadeIn("slow");
            if (curstep == 3) {

                $("#right").animate({
                    marginLeft: "893px"
                }, 400);


            }
        }
    }
}

