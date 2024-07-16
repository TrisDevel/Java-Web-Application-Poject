let currentIndex = 0;

  function showSlide(index) {
    const carouselWrapper = document.querySelector('.carousel-wrapper');
    const totalItems = document.querySelectorAll('.carouselite').length;
    const visibleItems = 4;
    const maxIndex = totalItems - visibleItems;

    if (index < 0) {
      currentIndex = maxIndex;
    } else if (index > maxIndex) {
      currentIndex = 0;
    } else {
      currentIndex = index;
    }

    const offset = currentIndex * -25;
    carouselWrapper.style.transform = `translateX(${offset}%)`;
  }

  function prevSlide() {
    showSlide(currentIndex - 1);
  }

  function nextSlide() {
    showSlide(currentIndex + 1);
  }