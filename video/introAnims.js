var fixElement = function(el, left, top, width, height) {
    el.css("top", top);
    el.css("left", left);
    if (width)
        el.css("width", width);
    if (height)
        el.css("height", height);
}


var activate = function(el) {
    el.addClass("active");
}

var hideClip = function(e) {
    e.removeClass("active");
}

var placeJohn = function() {
    activate($("#john"));
    fixElement($("#john"), 100, 295);
}

var placeDegree = function() {
    activate($("#think"));
    fixElement($("#think"), 178, 200);
    activate($("#degree"));
    fixElement($("#degree"), 218, 220);
}

var placeSchool = function() {
    activate($("#school"));
    fixElement($("#school"), 750, 55);
}

var placeRunning = function() {
    activate($("#running"));
    hideClip($("#john"));
    hideClip($("#think"));
    hideClip($("#degree"));

    fixElement($("#running"), 250, 295);
}

var placeConfused = function() {
    hideClip($("#running"));

    activate($("#confused"));
    fixElement($("#confused"), 450, 295);

    activate($("#whatNext"));
    fixElement($("#whatNext"), 530, 205);
}

var placeAnswers = function() {
    activate($("#phd"));
    activate($("#jobs"));
    activate($("#company"));

    fixElement($("#phd"), 570, 100);
    fixElement($("#jobs"), 570, 0);
    fixElement($("#company"), 570, 300);
}

var placeRobotics = function() {
    activate($("#robotics"));
    fixElement($("#robotics"), 530, 205);
}


function showCoords(e) {
    alert (e.clientX + ", " + e.clientY);
}
document.body.addEventListener("mousedown", showCoords, false);

var animations = [ placeJohn
                   , placeDegree
                   , placeSchool
                   , placeRunning
                   , placeConfused
                   , placeAnswers
                   , placeRobotics
                 ];
var curAnimation = 0;
var nextAnimation = function() {
    animations[curAnimation]();
    curAnimation++;
    if (curAnimation < animations.length) {
        setTimeout(nextAnimation, 1000);
    }
}
nextAnimation();
api.next();
//setTimeout(function(){x.value="2 seconds"},2000);

