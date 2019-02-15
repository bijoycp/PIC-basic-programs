
var creative = {};
var car = {};
/**
* Window onload handler.
*/
function preInit() {
    setupDom();

    if (Enabler.isInitialized()) {
        init();
    } else {
        Enabler.addEventListener(
            studio.events.StudioEvent.INIT,
            init
        );
    }
}

/**
* Select ad elements with zepto selectors to setup dom
*/
function setupDom() {
    creative.dom = {};
    creative.dom.mainContainer = document.getElementById('main-container');
    creative.dom.exit = document.getElementById('exit');

    creative.dom.phone = $('#phone');
    creative.dom.handPhone1 = $('#handPhone1');
    creative.dom.handPhone2 = $('#handPhone2');
    creative.dom.comp = $('#computer');
    creative.dom.handComp1 = $('#handComp1');
    creative.dom.handComp2 = $('#handComp2');
    creative.dom.cup = $('#cup');
    creative.dom.tablet = $('#tablet');
    creative.dom.handTab1 = $('#handTablet1');
    creative.dom.handTab2 = $('#handTablet2');
    creative.dom.compDog = $('#computerDog');
    creative.dom.paw1 = $('#paw1');
    creative.dom.paw2 = $('#paw2');
    // creative.dom.copy1 = $('#copy1');
    creative.dom.copy1F = $('#copy1-f');
    creative.dom.copy1O = $('#copy1-o');
    creative.dom.copy1R = $('#copy1-r');
    creative.dom.copy2a = $('#copy2a');
    creative.dom.copy2aG = $('#copy2a-g');
    creative.dom.copy2aR = $('#copy2a-r');
    creative.dom.copy2aO = $('#copy2a-o');
    creative.dom.copy2aW = $('#copy2a-w');
    creative.dom.copy2aI = $('#copy2a-i');
    creative.dom.copy2aN = $('#copy2a-n');
    creative.dom.copy2aG2 = $('#copy2a-g2');
    creative.dom.copy2b = $('#copy2b');
    creative.dom.copy2bW = $('#copy2b-w');
    creative.dom.copy2bI = $('#copy2b-i');
    creative.dom.copy2bT = $('#copy2b-t');
    creative.dom.copy2bH = $('#copy2b-h');
    // creative.dom.copy2c = $('#copy2c');
    creative.dom.copy2cY = $('#copy2c-y');
    creative.dom.copy2cO = $('#copy2c-o');
    creative.dom.copy2cU = $('#copy2c-u');
    creative.dom.copy2cR = $('#copy2c-r');
    // creative.dom.copy2d = $('#copy2d');
    creative.dom.copy2dT = $('#copy2d-t');
    creative.dom.copy2dE = $('#copy2d-e');
    creative.dom.copy2dA = $('#copy2d-a');
    creative.dom.copy2dM = $('#copy2d-m');
    creative.dom.copy2dPeriod = $('#copy2d-period');
    creative.dom.copy3 = $('#copy3');
    creative.dom.dotdotdot = $('#dotdotdot');
    creative.dom.dot1 = $('#dot1');
    creative.dom.dot2 = $('#dot2');
    creative.dom.dot3 = $('#dot3');
    creative.dom.logo = $('#logo');
    creative.dom.cta = $('#cta');
    creative.dom.footer = $('#footer');
    creative.dom.startNowButtonShimmer = $('.icon-effect');
}

/**
* Ad initialisation.
*/
function init() {

    addListeners();

    // Polite loading
    if (Enabler.isVisible()) {
        show();
    }
    else {
        Enabler.addEventListener(studio.events.StudioEvent.VISIBLE, show);
    }
}

/**
* Adds appropriate listeners at initialization time
*/
function addListeners() {
    creative.dom.exit.addEventListener('click', exitClickHandler);
}

/**
*  Shows the ad.
*/
function show() {
    creative.dom.exit.style.display = "block";
    //run the animations

    runAnimationLoop();
    phoneLoop();
    compLoop();
    tabletLoop();
    dogLoop();
    ellipsis();
}



function phoneLoop(){
    creative.phoneTimeline = new TimelineLite({
        onComplete:repeatPhone
    });

    creative.phoneTimeline

    .addLabel('phone-frame-1')
    .to(creative.dom.handPhone2, 0.5, {top:20, delay:1}, 'phone-frame-1')
    .to(creative.dom.handPhone1, 0.5, {top:7, delay:1.5}, 'phone-frame-1')
    .to(creative.dom.handPhone2, 0.5, {top:30, delay:3}, 'phone-frame-1')
    .to(creative.dom.handPhone1, 0.5, {top:10, delay:3.5}, 'phone-frame-1')
    .to(creative.dom.handPhone2, 0.5, {top:50, delay:6}, 'phone-frame-1')
    .to(creative.dom.handPhone1, 0.5, {top:0, delay:6.5}, 'phone-frame-1')
    .to(creative.dom.handPhone2, 0.5, {top:10, delay:7}, 'phone-frame-1')

    function repeatPhone (){

        creative.phoneTimeline.restart();
    }
}


function compLoop(){
    creative.compTimeline = new TimelineLite({
        onComplete:repeatComp
    });

    creative.compTimeline

    .addLabel('comp-frame-1')
    .to(creative.dom.handComp2, 0.25, {right:-70, delay:0}, 'comp-frame-1')
    .to(creative.dom.handComp1, 0.25, { right:-45, delay:0.25}, 'comp-frame-1')
    .to(creative.dom.handComp2, 0.25, { right:-60 ,delay:0.3}, 'comp-frame-1')
    .to(creative.dom.handComp1, 0.25, { right:-50, delay:0.5}, 'comp-frame-1')
    .to(creative.dom.handComp2, 0.25, { right:-58, delay:0.75}, 'comp-frame-1')
    .to(creative.dom.handComp1, 0.15, { right:-45, delay:1}, 'comp-frame-1')
    .to(creative.dom.handComp2, 0.15, { right:-62, delay:1.25}, 'comp-frame-1')

    function repeatComp(){
        creative.compTimeline.restart();
    }
}


function tabletLoop(){
    creative.tabletTimeline = new TimelineLite({
        onComplete:repeatTablet
    });

    creative.tabletTimeline

    .addLabel('tab-frame-1')
    .to(creative.dom.handTab2, 0.5, {top:65, delay:1, force3D: true}, 'tab-frame-1')
    .to(creative.dom.handTab2, 0.5, {top:80,left:-40, delay:2, force3D: true}, 'tab-frame-1')
    .to(creative.dom.handTab2, 0.5, {left:-40,top:75, delay:2, force3D: true}, 'tab-frame-1')
    .to(creative.dom.handTab1, 0.5, {top:30, delay:3, force3D: true}, 'tab-frame-1')
    .to(creative.dom.handTab2, 0.5, {top:60, delay:3, force3D: true}, 'tab-frame-1')

    function repeatTablet(){
        creative.tabletTimeline.restart();
    }
}


function dogLoop(){
    creative.dogTimeline = new TimelineLite({
        onComplete:repeatDog
    });

    creative.dogTimeline

    .addLabel('dog-frame-1')
    .to(creative.dom.paw1, 0.5, {top:-10, delay:0}, 'dog-frame-1')
    .to(creative.dom.paw2, 0.5, {top:-20, delay:0.5}, 'dog-frame-1')
    .to(creative.dom.paw1, 0.5, {top:-20, delay:1}, 'dog-frame-1')
    .to(creative.dom.paw2, 0.5, {top:-30, delay:1.5}, 'dog-frame-1')
    .to(creative.dom.paw1, 0.5, {top:-10, delay:1.5}, 'dog-frame-1')
    .to(creative.dom.paw2, 0.5, {top:-20, delay:2}, 'dog-frame-1')
    .to(creative.dom.paw1, 0.5, {top:-20, delay:2.25}, 'dog-frame-1')
    .to(creative.dom.paw2, 0.5, {top:-30, delay:2.5}, 'dog-frame-1')

    function repeatDog(){
        creative.dogTimeline.restart();
    }
}


function ellipsis(){
    creative.dotsTimeline = new TimelineLite({
        onComplete:repeatDots
    });

    creative.dotsTimeline

    .addLabel('dot-frame-1')
    .to(creative.dom.dot1, 0.25, {autoAlpha:0, ease:Back.easeIn, delay:0}, 'dot-frame-1')
    .to(creative.dom.dot1, 0.25, { autoAlpha:1, ease:Back.easeOut, delay:0.25}, 'dot-frame-1')
    .to(creative.dom.dot2, 0.25, { autoAlpha:0, ease:Back.easeIn, delay:0.125}, 'dot-frame-1')
    .to(creative.dom.dot2, 0.25, { autoAlpha:1, ease:Back.easeOut, delay:0.5}, 'dot-frame-1')
    .to(creative.dom.dot3, 0.25, { autoAlpha:0, ease:Back.easeIn, delay:0.25}, 'dot-frame-1')
    .to(creative.dom.dot3, 0.25, { autoAlpha:1, ease:Back.easeOut, delay:0.75}, 'dot-frame-1')

    function repeatDots(){
        creative.dotsTimeline.restart();
    }

}

function runAnimationLoop(){
    creative.MainTimeline = new TimelineLite({
       onComplete:repeatMainTimeline
    });

    creative.MainTimeline

    .addLabel('frame-1')
    .to(creative.dom.logo, 0.5, {autoAlpha:0, delay:1}, 'frame-1')
    .to(creative.dom.footer, 0.5, {bottom:0,ease:Circ.easeOut, delay:1.5}, 'frame-1')
    .to(creative.dom.phone, 0.5, {top:5 ,ease:Circ.easeOut, delay:2}, 'frame-1')
    .to(creative.dom.copy2a, 0.5, {autoAlpha:1, delay:3}, 'frame-1')
    .to(creative.dom.copy1F, 0.1, {autoAlpha: 1, ease: Circ.easeOut, delay: 3.2}, 'frame-1')
    .to(creative.dom.copy2a, 0.1, {left: 86.5, delay:3.3}, 'frame-1')
    .to(creative.dom.copy1O, 0.1, {autoAlpha: 1, ease: Circ.easeOut, delay: 3.3}, 'frame-1')
    .to(creative.dom.copy2a, 0.1, {left: 78, delay:3.4}, 'frame-1')
    .to(creative.dom.copy1R, 0.1, {autoAlpha: 1, ease: Circ.easeOut, delay: 3.4}, 'frame-1')
    .to(creative.dom.dotdotdot, 0.5, {autoAlpha:1, delay:3.5}, 'frame-1')

    .addLabel('frame-2')
    .to(creative.dom.dotdotdot, 0.25, {autoAlpha:0, delay:2}, 'frame-2')
    .to(creative.dom.copy2a, 0.45, {left:30, delay:2, force3D: true}, 'frame-2')
    .to(creative.dom.copy2aG, 0.05, {autoAlpha:1, delay:2.15}, 'frame-2')
    .to(creative.dom.copy2aR, 0.05, {autoAlpha:1, delay:2.2}, 'frame-2')
    .to(creative.dom.copy2aO, 0.05, {autoAlpha:1, delay:2.25}, 'frame-2')
    .to(creative.dom.copy2aW, 0.05, {autoAlpha:1, delay:2.3}, 'frame-2')
    .to(creative.dom.copy2aI, 0.05, {autoAlpha:1, delay:2.35}, 'frame-2')
    .to(creative.dom.copy2aN, 0.05, {autoAlpha:1, delay:2.4}, 'frame-2')
    .to(creative.dom.copy2aG2, 0.05, {autoAlpha:1, delay:2.45}, 'frame-2')
    .to(creative.dom.copy2b, 0.1, {autoAlpha:1, delay:2.45, force3D: true}, 'frame-2')
    .to(creative.dom.copy2b, 0.6, {left:15, ease:Linear.easeNone, delay:2.5}, 'frame-2')
    .to(creative.dom.copy2bW, 0.05, {autoAlpha:1, delay:2.5}, 'frame-2')
    .to(creative.dom.copy2bI, 0.05, {autoAlpha:1, delay:2.55}, 'frame-2')
    .to(creative.dom.copy2bT, 0.05, {autoAlpha:1, delay:2.6}, 'frame-2')
    .to(creative.dom.copy2bH, 0.05, {autoAlpha:1, delay:2.65}, 'frame-2')
    .to(creative.dom.copy2cY, 0.05, {autoAlpha:1, delay:2.7}, 'frame-2')
    .to(creative.dom.copy2cO, 0.05, {autoAlpha:1, delay:2.75}, 'frame-2')
    .to(creative.dom.copy2cU, 0.05, {autoAlpha:1, delay:2.8}, 'frame-2')
    .to(creative.dom.copy2cR, 0.05, {autoAlpha:1, delay:2.85}, 'frame-2')
    .to(creative.dom.copy2dT, 0.05, {autoAlpha:1, delay:2.9}, 'frame-2')
    .to(creative.dom.copy2dE, 0.05, {autoAlpha:1, delay:2.95}, 'frame-2')
    .to(creative.dom.copy2dA, 0.05, {autoAlpha:1, delay:3}, 'frame-2')
    .to(creative.dom.copy2dM, 0.05, {autoAlpha:1, delay:3.05}, 'frame-2')
    .to(creative.dom.copy2dPeriod, 0.05, {autoAlpha:1, delay:3.1}, 'frame-2')
    .to(creative.dom.phone, 0.5, {scale:0.5, top:25, left:230, delay:2}, 'frame-2')
    .to(creative.dom.comp, 0.5, {scale: 0.85, top:-10, ease:Circ.easeOut, delay:2.25}, 'frame-2')
    .to(creative.dom.phone, 0.5, { top:30, left:275, ease:Circ.easeInOut, delay:3.75}, 'frame-2')
    .to(creative.dom.comp, 0.5, { left:417, ease:Circ.easeInOut, delay:3.75}, 'frame-2')
    .to(creative.dom.tablet, 0.5, {scale:0.65, top:20, ease:Circ.easeInOut, delay:3.75, force3D: true}, 'frame-2')
    .to(creative.dom.copy2a, 0.25, {autoAlpha:0, delay:5.75}, 'frame-2')
    .to(creative.dom.copy2b, 0.25, {autoAlpha:0, delay:5.75}, 'frame-2')
    .to(creative.dom.phone , 0.7, {left:250, delay: 5.75, ease: Power4.easeInOut}, 'frame-2')
    .to(creative.dom.comp , 0.7, {left:400, delay: 5.75, ease: Power4.easeInOut}, 'frame-2')
    .to(creative.dom.tablet , 0.7, {left:260, delay: 5.75, ease: Power4.easeInOut}, 'frame-2')
    .to(creative.dom.compDog, 0.5, {scale: 0.85, top:90, ease:Circ.easeOut, delay:6.25}, 'frame-2')

    .addLabel('frame-3')
    .to(creative.dom.phone, 0.5, {top:350, ease:Circ.easeIn, delay:2}, 'frame-3')
    .to(creative.dom.comp, 0.5, {top:-200, ease:Circ.easeIn, delay:2}, 'frame-3')
    .to(creative.dom.tablet, 0.5, {top:-200, ease:Circ.easeIn, delay:2}, 'frame-3')
    .to(creative.dom.compDog, 0.5, {top:200, ease:Circ.easeIn, delay:2}, 'frame-3')
    .to(creative.dom.logo, 0.25, {scale: 0.8, top:30, left:0, autoAlpha:1, ease:Circ.easeOut, delay:2.25}, 'frame-3')
    .to(creative.dom.footer, 0.25, {bottom:-100, ease:Circ.easeIn, delay:2.25}, 'frame-3')
    .to(creative.dom.copy3, 0.25, {autoAlpha:1, delay:3}, 'frame-3')
    .to(creative.dom.cta, 0.5, {scale:1, autoAlpha:1,  ease:Back.easeOut, delay:3, force3D: true}, 'frame-3')

    .addLabel('shimmer')
    .set(creative.dom.startNowButtonShimmer, {className: "+=shimmer"},'shimmer')
    .to(creative.dom.startNowButtonShimmer,0.6, {autoAlpha:0,delay:0.5},'shimmer')

    creative.playedOnce = false;
    function repeatMainTimeline(){
        if (creative.playedOnce == false) {
            creative.playedOnce = true;
            setTimeout(function(){
                creative.MainTimeline.restart();
            },3000)
        } else {
            //donothing
        }
    }

}



// ---------------------------------------------------------------------------------
// MAIN
// ---------------------------------------------------------------------------------

function exitClickHandler() {
    Enabler.exit('BackgroundExit');
}

/**
*  Main onload handler
*/
window.addEventListener('load', preInit);
