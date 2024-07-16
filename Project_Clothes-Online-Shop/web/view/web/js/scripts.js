const productsPerPage = 9;
const products = document.querySelectorAll('.product');
const totalProducts = products.length;
const totalPages = Math.ceil(totalProducts / productsPerPage);
const paginationContainer = document.getElementById('moreproduct');

function showPage(page) {
    const start = (page - 1) * productsPerPage;
    const end = start + productsPerPage;

    products.forEach((product, index) => {
        if (index >= start && index < end) {
            product.style.display = 'flex';
        } else {
            product.style.display = 'none';
        }
    });
}

function createPaginationButtons() {
    for (let i = 1; i <= totalPages; i++) {
        const button = document.createElement('button');
        button.className = 'page-btn';
        button.textContent = i;
        button.addEventListener('click', () => showPage(i));
        paginationContainer.appendChild(button);
    }
}

// Initialize the first page and create pagination buttons
showPage(1);
createPaginationButtons();
