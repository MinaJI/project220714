function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.3)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.body.style.backgroundColor = "white";
}

function dropdown() {
    let dropdown = document.getElementsByClassName("dropdown-btn");
    for (var i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function () {
            this.classList.toggle("show");
            let dropdownContent = document.getElementById("dropdown-container");
            if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
            } else {
                dropdownContent.style.display = "block";
            }
        });
    }
}

