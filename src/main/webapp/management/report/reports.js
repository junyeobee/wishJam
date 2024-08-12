document.addEventListener('DOMContentLoaded', function() {
    const statusChangeBtns = document.querySelectorAll('.status-change-btn');
    
    statusChangeBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            // You can implement the logic to change the status here
            alert('버튼클릭');
        });
    });
});
