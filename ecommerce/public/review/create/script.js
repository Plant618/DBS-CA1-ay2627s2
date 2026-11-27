// TODO: Implement the necessary code for create review functionality

document.addEventListener("DOMContentLoaded", () => {
    const token = localStorage.getItem("token");
    if (!token) {
        window.location.href = "/auth/login";
        return;
    }
    const username = localStorage.getItem("username") || "User";
    document.getElementById("navUsername").textContent = username;
});

// Ratings 
const allStar = document.querySelectorAll('.rating .star')
const ratingValue = document.querySelector('.rating input')

allStar.forEach((item, id)=> {
	item.addEventListener('click', function () {
		let click = 0
        // Since index starts from 0
		ratingValue.value = id + 1

		allStar.forEach(i=> {
            // Reset all the stars
			i.classList.replace('bxs-star', 'bx-star')
			i.classList.remove('active')
		})

		for(let i = 0; i < allStar.length; i++) {
			if(i <= id) {
                // If i is less than or equal to id, change to the filled in star and add active class
				allStar[i].classList.replace('bx-star', 'bxs-star')
				allStar[i].classList.add('active')
			}
		}

	})
})