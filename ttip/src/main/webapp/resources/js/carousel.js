document.addEventListener('DOMContentLoaded', function () {
    const slideContainer = document.querySelector('.carousel-slide');
    const prevBtn = document.querySelector('.prev-btn');
    const nextBtn = document.querySelector('.next-btn');
    let currentIndex = 0;

    function showSlide(index) {
        slideContainer.style.transform = `translateX(${-index * 100}%)`;
    }

	function nextSlide() {
	    currentIndex = (currentIndex + 1) % slideContainer.children.length;
	    showSlide(currentIndex);
	}

	function prevSlide() {
	    currentIndex = (currentIndex - 1 + slideContainer.children.length) % slideContainer.children.length;
	    showSlide(currentIndex);
	}

	nextBtn.addEventListener('click', nextSlide);
	prevBtn.addEventListener('click', prevSlide);
});