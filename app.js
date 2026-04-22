document.addEventListener('DOMContentLoaded', () => {
    initChart();
    setupEventListeners();
    animateValue('stat-value');
});

function initChart() {
    const chart = document.getElementById('consumption-chart');
    if (!chart) return;

    // Clear existing
    chart.innerHTML = '';

    // Mock data for 14 days
    const dailyData = [45, 60, 30, 80, 55, 90, 70, 40, 65, 85, 30, 20, 50, 75];
    const max = Math.max(...dailyData);

    dailyData.forEach((value, index) => {
        const bar = document.createElement('div');
        bar.className = 'bar';
        bar.style.height = '0%';
        bar.title = `Day ${index + 1}: ${value}L`;
        
        chart.appendChild(bar);

        // Trigger animation
        setTimeout(() => {
            bar.style.height = `${(value / max) * 100}%`;
        }, 100 * index);
    });
}

function setupEventListeners() {
    const refreshBtn = document.getElementById('refresh-data');
    if (refreshBtn) {
        refreshBtn.addEventListener('click', () => {
            refreshBtn.innerText = 'Syncing...';
            refreshBtn.disabled = true;
            
            // Simulate API fetch delay
            setTimeout(() => {
                initChart();
                refreshBtn.innerText = 'Refresh Data';
                refreshBtn.disabled = false;
                showNotification('Data synchronized with SQL backend successfully.');
            }, 1500);
        });
    }

    // Nav navigation simulation
    const navItems = document.querySelectorAll('.nav-links li');
    navItems.forEach(item => {
        item.addEventListener('click', () => {
            navItems.forEach(i => i.classList.remove('active'));
            item.classList.add('active');
        });
    });
}

function animateValue(className) {
    // Simple counter animation for stats could go here
}

function showNotification(message) {
    const toast = document.createElement('div');
    toast.style.position = 'fixed';
    toast.style.bottom = '20px';
    toast.style.right = '20px';
    toast.style.background = 'var(--secondary)';
    toast.style.color = 'white';
    toast.style.padding = '12px 24px';
    toast.style.borderRadius = '12px';
    toast.style.boxShadow = '0 10px 15px -3px rgba(0,0,0,0.3)';
    toast.style.zIndex = '1000';
    toast.style.opacity = '0';
    toast.style.transform = 'translateY(20px)';
    toast.style.transition = 'all 0.3s ease';
    
    toast.textContent = message;
    document.body.appendChild(toast);

    setTimeout(() => {
        toast.style.opacity = '1';
        toast.style.transform = 'translateY(0)';
    }, 100);

    setTimeout(() => {
        toast.style.opacity = '0';
        toast.style.transform = 'translateY(20px)';
        setTimeout(() => toast.remove(), 300);
    }, 3000);
}
