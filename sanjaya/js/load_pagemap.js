window.onload = function(){
    var getPageMapContainer = document.querySelector("#main-pagemap");
    var getMaps = document.querySelectorAll(".assign-pagemap");
    var maps = [];
    getMaps.forEach(d=>{
        var getMapName = d.getAttribute("pagemap-data-name");
        var map = {
            map_name: getMapName != null ? getMapName : "Unknown map",
            url: "#" + d.getAttribute("id")
        };
        maps.push(map);
    });
    var getContainerChild = getPageMapContainer.querySelector(".modal-body").querySelector(".list-group")
    maps.forEach(d=>{
        var createList = document.createElement("li");

        createList.setAttribute("pagemap-redirection", d.url);
        createList.innerText = d.map_name;
        createList.style.cursor = "pointer";
        createList.classList.add("list-group-item", "text-primary");

        createList.addEventListener("click", function(){
            var getModal = bootstrap.Modal.getInstance(getPageMapContainer);
            getModal.hide();
            setTimeout(()=>{
                location.href = this.getAttribute("pagemap-redirection");
            }, 500)
        })
        getContainerChild.appendChild(createList);
    });
}