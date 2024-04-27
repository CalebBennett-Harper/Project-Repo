// savings.js

// Function to load total savings for a user
function loadTotalSavings(userId) {
    $.get(`/savings/total/${userId}`, function(data) {
        $('#totalSavings').html(data);
    });
}

// Function to load a specific savings transaction
function loadSavingsTransaction(savingsId) {
    $.get(`/savings/transaction/${savingsId}`, function(data) {
        $('#content').html(data);
    });
}

// Function to load the create savings transaction form
function loadCreateForm() {
    $.get('/savings/create', function(data) {
        $('#content').html(data);
    });
}

// Function to load the update savings transaction form
function loadUpdateForm(savingsId) {
    $.get(`/savings/${savingsId}/update`, function(data) {
        $('#content').html(data);
        // Add event listener after loading the form
        document.getElementById('updateForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent the form from submitting normally
            var form = this;
            var formData = new FormData(form);
            
            fetch(form.action, {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    document.getElementById('updateForm').style.display = 'none';
                    document.getElementById('confirmation').style.display = 'block';
                }
            })
            .catch(error => console.error('Error:', error));
        });
    });
}

// Function to load the delete confirmation for a savings transaction
function loadDeleteConfirmation(savingsId) {
    $.get(`/savings/${savingsId}/delete`, function(data) {
        $('#content').html(data);
    });
}
