const data = [10, 20, 30, 40, 50];
const labels = ['A', 'B', 'C', 'D', 'E'];
const chart = document.getElementById('barChart');
const maxDataValue = Math.max(...data);

function drawBarChart() {
    data.forEach((value, index) => {
        const bar = document.createElement('div');
        bar.className = 'bar';
        bar.style.height = `${(value / maxDataValue) * 100}%`;

        const label = document.createElement('div');
        label.className = 'bar-label';
        label.textContent = labels[index];

        bar.appendChild(label);

        chart.appendChild(bar);
    });
}
drawBarChart();
