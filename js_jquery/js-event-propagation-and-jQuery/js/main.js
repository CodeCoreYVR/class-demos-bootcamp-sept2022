//JS DOM query
// document.querySelectorAll('.shape') //this will return a node list of all the nodes with the shape class

//jQuery DOM query
// $('.shape') //this will return a collection of nodes with the class of shape, and it will allow you to use utility methods on the collection

//select the 2nd button
$('#button-2');

//select anchor tags inside the li tags
$('li a')

//count the number of blue circles
$('.blue.circle').length

//Attributes, Classes and Removal:

// Return the value of an attribute:
// $(selector).attr(attribute)
// Set the attribute and value:
// $(selector).attr(attribute,value)

// .addClass()
// It's important to note that this method does not replace a class. It simply adds the class, appending it to any which may already be assigned to the elements.
// .removeClass()
// If a class name is included as a parameter, then only that class will be removed from the set of matched elements. If no class names are specified in the parameter, all classes will be removed.

// The toggleClass() method toggles between adding and removing one or more class names from the selected elements.
// This method checks each element for the specified class names. The class names are added if missing, and removed if already set - This creates a toggle effect.


//change the href of all links oon the page
$('a').attr('href', 'http://nyan.cat');

//remove the blue class from all shapes, and replace it with the red class
$('.blue').removeClass('blue').addClass('red')

//set the class attribute of all a tags to highlight
$('a').attr('class', 'highlight');

//remove the class of circle and replace as diamond
$('.circle').removeClass('circle').addClass('diamond');

//Remove all the shapes in the purple and green containers:

//1
$('#purple-container, #green-container').find('.shape').remove()

//2
$('#purple-container .shape, #green-container .shape').remove()

//3
$('#purple-container, #green-container').empty()

//Read methods work on the first node of the collection, while Write methods work on every node of the collection
//Example
$('a').attr('href') //only returns the first node's href -> "http://google.com"
$('a').first().attr('href') //will also only return the first node's href -> "http://google.com"
$('a').last().attr('href') //will only return the last node's href
$('a').eq(3).attr('href') //will only return the href of node in index 3 of the collection

//Luckily in jQuery we don't need to iterate over all the nodes in order to "write" to them
$('a').attr('href', 'http://nyan.cat') //will write this attribute to all the a tag nodes

// Iterating over a jQuery Collection

// To get the first node in a jQuery list, use `.first`
$('.shape').first();
// For the last thing, `.last`
$('.shape').last();


// To get a node at a specific index, use `.eq`
$('.shape').eq(2); // this begins counting at 0, returns the 3rd element in the list
$('.shape').eq(4);


// These method return to you a jQuery wrapped object so that we can still use
// all of the jQuery methods on that node
// As opposed to doing the following:
$('.shape')[4];
// While this does give us a node, it no longer will be wrapped by jQuery
// so we will not have access to jQuery methods






//html, children, and parent

// Get “html” of the reset button
$('#reset').html();
// Try to get “html” of all links.
$('a').map((index, element) => {
    console.log($(element).html())
});
// Change “reset” button to read “Launch Doggos!”
$('#reset').html('Launch Doggos');

//replace contents of every td with yass
$('td').html('yass')
//select parents of all td tags
$('td').parent()

$('tr').children(); //children method selects all children
$('tr').children().html('first children tr'); //this will replace the html of all the children
$('tr').children().first().html('first children tr'); //this will replace the html of only the first child

//Creating Nodes, append, prepend

// create a small blue diamond with $
const smallBlueDiamondShape = $('<div class="small blue diamond shape"></div>');
// Append s small blue diamond to every node with the class "container"
$('.container').append($('<div class="small blue diamond shape"></div>'));
// prepend a new link to the list of links
$('ul').prepend('<li><a href="http://nyan.cat">NyanCat</a></li>');

// Create a div with the "container class"
const container = $('<div class="container"></div>');
// Prepend it to the first section tag in the body
$('section')
 .first()
 .prepend(container);
// Append a "small black circle" to the container
container.append($('<div class="small black circle shape"></div>'));


//Event Listeners

//In JS we need to load the page with DOMContentLoaded
//In jQuery we use .ready

$(document).ready(() => {
    //When your mouse enters any blue circle, log “Blue Circle: Go away!” to the console.
    $('.blue.circle').on('mouseenter', event => {
        console.log('Blue Circle: Go Away!')})
    
    //When your mouse leaves any blue circle, log “Blue Circle: Goodbye!” to the console.  
    $('.blue.circle').on('mouseleave', event => {
        console.log('Blue Circle: Goodbye!')})

    //When “button 1” is clicked, remove all shapes.
    $('#button-1').on('click', event => {
        $('.shape').remove()
    })

    //When “button 2” is clicked, disable “button 2”. (set the “disabled” attribute to true)
    $('#button-2').on('click', event => {
        $(event.currentTarget).attr('disabled', 'true')
    })

    //When “button 3” is clicked, set the button message to “Button 3 was clicked”
    $('#button-3').on('click', event => {
        $('#button-message').html('Button 3 was clicked')
    })

    //When your mouse enters any “tr”, add “highlight” class
    $('tr').on('mouseenter', event => {
        $(event.currentTarget).addClass("highlight")
    })

    //When your mouse leaves any “tr”, remove the “highlight” class.
    $('tr').on('mouseleave', event => {
        $(event.currentTarget).removeClass("highlight")
    })

})




