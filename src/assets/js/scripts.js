// /*================
//  Template Name: AppCo App Landing Page Template
//  Description: AppCo is app and product landing page template.
//  Version: 1.0
//  Author: https://themeforest.net/user/themetags
// =======================*/

// // TABLE OF CONTENTS
// // 1. fixed navbar
// // 2. page scrolling feature - requires jQuery Easing plugin
// // 3. closes the responsive menu on menu item click
// // 4. magnify popup video
// // 5. client testimonial slider
// // 6. Screenshots slider
// // 7. custom counter js with scrolling
// // 8. client-testimonial one item carousel
// // 9. our clients logo carousel
// // 10. our clients logo carousel
// // 11. wow js


// jQuery(function ($) {

//     'use strict';
   

   
//     // 6. Screenshots slider
//     $('.screen-carousel').owlCarousel({
//         loop: true,
//         margin: 0,
//         center: true,
//         dots: false,
//         nav: false,
//         autoplay: true,
//         responsive: {
//             0: {
//                 items: 1
//             },
//             768: {
//                 items: 2
//             },
//             991: {
//                 items: 3
//             },
//             1200: {
//                 items: 3
//             },
//             1920: {
//                 items: 3
//             }
//         }
//     });


    

//     /**
//      * Get the increment value
//      * @param value
//      * @returns {number}
//      */
//     function incrementValue(value) {
//         var incVal = 0;
//         if(Math.ceil(value / 2) <= 5){ // upto 10
//             incVal = 1;
//         }
//         else if(Math.ceil(value / 10) <= 10) { // up to 100
//             incVal = 10;
//         }
//         else if(Math.ceil(value / 100) <= 10) { // up to 1000
//             incVal = 25;
//         }
//         else if(Math.ceil(value / 100) <= 100) { // up to 10000
//             incVal = 50;
//         }
//         else if(Math.ceil(value / 1000) <= 100) { // up to 100000
//             incVal = 150;
//         }
//         else {
//             incVal = 500;
//         }
//         return incVal;
//     }

//     /**
//      * To start count
//      * @param counters all selectors
//      * @param start int
//      * @param value int
//      * @param id int
//      */
//     function count(counters, start, value, id) {
//         var localStart = start;
//         var inc = incrementValue(value);
//         interval = setInterval(function() {
//             if (localStart < value) {
//                 localStart = localStart+inc;
//                 counters[id].innerHTML = localStart;
//             }
//         }, 40);
//     }

//     /**
//      * Start the count
//      */
//     function startCounting() {
//         var counters = $(".single-counter > span, .single-card > h3");
//         var countersQuantity = counters.length;
//         var counter = [];

//         // get al counts from HTML count
//         for (var i = 0; i < countersQuantity; i++) {
//             counter[i] = parseInt(counters[i].innerHTML);
//         }

//         // calling all count function
//         for (var j = 0; j < countersQuantity; j++) {
//             count(counters, 0, counter[j], j);
//         }
//     }

    


//     // 11. wow js
//     function wowAnimation(){
//         new WOW({
//             offset: 100,
//             mobile: true
//         }).init()
//     }
//     wowAnimation()



// }); // JQuery end