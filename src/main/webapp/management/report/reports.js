document.addEventListener('DOMContentLoaded', function() {
    const statusChangeBtns = document.querySelectorAll('.status-change-btn');
    const modal = document.getElementById('report-modal');
    const modalClose = document.querySelector('.modal .close');
    
    statusChangeBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const rpIdx = this.getAttribute('data-rp-idx');
            
            // AJAX 요청 또는 DTO 데이터를 기반으로 모달에 정보 채우기
            fillModalWithData(rpIdx);

            // 모달 열기
            modal.style.display = 'block';
        });
    });

    modalClose.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    window.addEventListener('click', function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    });
});

function fillModalWithData(rpIdx) {
    // 여기에 모달에 데이터를 채우는 로직을 구현합니다.
    // 예: document.getElementById('modal-rp-idx').textContent = rpIdx;
    // 필요한 데이터를 가져와서 모달에 표시
}
