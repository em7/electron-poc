window.addEventListener('DOMContentLoaded',
    (event) => {
        fetch("http://localhost:5000")
            .then(response => response.json())
            .then(data => {
                document.getElementById('message')
                    .textContent = data.message
            })
            .catch(error => console.error('Error:', error));
    });