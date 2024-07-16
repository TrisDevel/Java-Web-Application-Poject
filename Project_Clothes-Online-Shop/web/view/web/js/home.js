function showThankYouMessage() {
    var emailInput = document.getElementById('emailInput');
    if (emailInput.value) {
        var thankYouMessage = document.getElementById('thankYouMessage');
        thankYouMessage.style.display = 'block';

        setTimeout(function() {
            thankYouMessage.style.display = 'none';
        }, 3000); // Hide after 3 seconds

        // Optionally, you can clear the input field
        emailInput.value = '';
    }
}