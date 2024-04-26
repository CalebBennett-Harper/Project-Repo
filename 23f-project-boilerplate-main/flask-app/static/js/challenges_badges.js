document.getElementById('addChallengeForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const title = document.getElementById('challengeTitle').value;
    const description = document.getElementById('challengeDescription').value;
    addChallenge(title, description);
});

function fetchChallenges() {
    fetch('/challenges/')
        .then(response => response.json())
        .then(challenges => {
            const container = document.getElementById('challengesContainer');
            container.innerHTML = ''; // Clear previous content
            challenges.forEach(challenge => {
                const challengeElement = document.createElement('div');
                challengeElement.innerHTML = `
                    <h3>${challenge.title}</h3>
                    <p>${challenge.description}</p>`;
                container.appendChild(challengeElement);
            });
        });
}

function addChallenge(title, description) {
    const challengeData = { title, description };
    fetch('/challenges/', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(challengeData)
    }).then(response => {
        if (response.ok) {
            alert('Challenge added');
            fetchChallenges();
        }
    });
}

function fetchBadges() {
    fetch('/badges/')
        .then(response => response.json())
        .then(badges => {
            const container = document.getElementById('badgesContainer');
            container.innerHTML = ''; // Clear previous content
            badges.forEach(badge => {
                const badgeElement = document.createElement('div');
                badgeElement.innerHTML = `
                    <h3>${badge.title}</h3>
                    <p>${badge.description}</p>`;
                container.appendChild(badgeElement);
            });
        });
}