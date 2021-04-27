$(document).ready(function() {
    let slcInstitute = document.querySelector("#user_institute_id");
    getSections(slcInstitute.value);
    slcInstitute.onchange = function() {
        getSections(this.value)
    }
})


const getSections = (institute_id) => {
    fetch("http://localhost:3000/api/filter/section?institute_id=" + institute_id)
        .then(response => response.json())
        .then(data => {
            document.querySelector("#user_section_id").innerHTML = "";
            data.sections.forEach(section => {
                document.querySelector("#user_section_id").innerHTML += `
                <option value="${section.id}">${section.name}</option>
                `
            });
        })
}