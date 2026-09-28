// Tạo hiệu ứng bong bóng nổi tự động
const bubblesContainer = document.getElementById('bubbles-container');
const bubbleCount = 25;
for (let i = 0; i < bubbleCount; i++) {
    const bubble = document.createElement('div');
    bubble.classList.add('bubble-element');
    const size = Math.random() * 10 + 5;
    bubble.style.width = `${size}px`;
    bubble.style.height = `${size}px`;
    bubble.style.left = `${Math.random() * 100}vw`;
    bubble.style.animationDuration = `${Math.random() * 5 + 4}s`;
    bubble.style.animationDelay = `${Math.random() * 5}s`;
    bubblesContainer.appendChild(bubble);
}

// Tương tác chuột thời gian thực: Nghiêng 3D model theo con trỏ
const modelViewer = document.getElementById('product-model');
const cards = document.querySelectorAll('.card');

window.addEventListener('mousemove', (e) => {
    const x = (e.clientX / window.innerWidth - 0.5) * 20;
    const y = (e.clientY / window.innerHeight - 0.5) * 20;
    
    gsap.to(modelViewer, {
        rotationY: x,
        rotationX: -y,
        duration: 0.5,
        ease: "power2.out"
    });
});

// Chuyển đổi hương vị (Classic <-> Zero Lime)
cards.forEach(card => {
    card.addEventListener('click', () => {
        cards.forEach(c => c.classList.remove('active'));
        card.classList.add('active');

        const flavor = card.getAttribute('data-flavor');
        
        if (flavor === 'blue') {
            document.body.classList.add('blue-theme');
        } else {
            document.body.classList.remove('blue-theme');
        }

        gsap.to(modelViewer, {
            rotation: "+=720",
            duration: 1.2,
            ease: "power3.inOut"
        });
    });
});
  
