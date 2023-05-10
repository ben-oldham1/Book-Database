// Toggle the colour mode between light/dark
function toggleDarkMode() {
    // Get the outer HTML element that controls light/dark formatting
    let colourModeElement = document.getElementById("colourModeElement");
    let colourMode = colourModeElement.getAttribute("data-bs-theme");
    
    // Toggle the colour mode
    if (colourMode == "dark"){
        colourMode = "light";
        // Set new text and icon for button
        buttonText = '<i class="bi bi-moon-stars"></i> Dark mode';
    } else {
        colourMode = "dark";
        buttonText = '<i class="bi bi-sun"></i> Light mode';
    }
    
    // Update the actual text in the button
    colourModeElement.setAttribute("data-bs-theme", colourMode);
    // Save dark/light choice to sessionStorage
    sessionStorage.setItem("colourTheme", colourMode);

    // Update the toggle button text
    document.getElementById("colourModeToggle").innerHTML = buttonText;
}

function setColourMode() {
    // Get saved data from sessionStorage
    let colourMode = sessionStorage.getItem("colourTheme");

    // Set the attribute that controls colour formatting to the saved choice
    colourModeElement.setAttribute("data-bs-theme", colourMode);
}

// Use jQuery to update the placeholder value in search input
function changePlaceholder() {

    // Get the select box HTML element
    var selectBox = document.getElementById("searchBy");
    // Get the index of the currently selected choice
    var index = selectBox.selectedIndex;
    
    // Update the placeholder text based on the index of selection box
    if (index == 0) {
        jQuery("#query").attr("placeholder", "E.g. To Kill A Mockingbird");
    }
    if (index == 1) {
        jQuery("#query").attr("placeholder", "E.g. Harper Lee");
    }
    if (index == 2) {
        jQuery("#query").attr("placeholder", "E.g. 1960");
    }
    if (index == 3) {
        jQuery("#query").attr("placeholder", "E.g. 9780099549482");
    }
}

// This function appends the genre parameter to the browse URL
function insertParam(value) {
    key = encodeURIComponent('genre');
    value = encodeURIComponent(value);

    // This code gets the current URL query string and splits the string into an array of key-value pairs
    // kvp looks like ['key1=value1', 'key2=value2', ...]
    var kvp = document.location.search.substr(1).split('&');

    let i=0;
    // This loop iterates through each key-value pair in the `kvp` array
    for(; i<kvp.length; i++){

        // If a key-value pair starts with "genre=", we found the "genre" parameter in the URL
        if (kvp[i].startsWith(key + '=')) {

            // Replace the old genre value with the new one
            let pair = kvp[i].split('=');
            pair[1] = value;
            kvp[i] = pair.join('=');
            break;

        }
    }

    // If the genre parameter isn't found in the URL, add it to the end of the `kvp` array
    if(i >= kvp.length){
        kvp[kvp.length] = [key,value].join('=');
    }

    // Join the updated key-value pairs into a new query string
    let params = kvp.join('&');

    // Reload page with new params
    document.location.search = params;
}