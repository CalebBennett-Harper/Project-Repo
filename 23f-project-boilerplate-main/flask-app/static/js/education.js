// education.js

// Function to fetch all educational materials
function getAllMaterials() {
    fetch('/education/')
    .then(response => response.json())
    .then(data => {
        // Process data as needed, e.g., update HTML content
        console.log(data);
    })
    .catch(error => {
        console.error('Error fetching materials:', error);
    });
}

// Function to fetch a specific educational material by resource ID
function getMaterial(resourceId) {
    fetch(`/education/${resourceId}`)
    .then(response => response.json())
    .then(data => {
        // Process data as needed, e.g., update HTML content
        console.log(data);
    })
    .catch(error => {
        console.error('Error fetching material:', error);
    });
}

// Function to add a new educational material
function addMaterial(data) {
    fetch('/education/', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        // Process data as needed, e.g., show success message
        console.log(data);
    })
    .catch(error => {
        console.error('Error adding material:', error);
    });
}

// Function to update an existing educational material
function updateMaterial(resourceId, data) {
    fetch(`/education/${resourceId}/update`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        // Process data as needed, e.g., show success message
        console.log(data);
    })
    .catch(error => {
        console.error('Error updating material:', error);
    });
}

// Function to delete an existing educational material
function deleteMaterial(resourceId) {
    fetch(`/education/${resourceId}/delete`, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(data => {
        // Process data as needed, e.g., show success message
        console.log(data);
    })
    .catch(error => {
        console.error('Error deleting material:', error);
    });
}
