document.getElementById('addPostForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const supportId = document.getElementById('supportId').value;
    const userId = document.getElementById('userId').value;
    const content = document.getElementById('content').value;
    addPost(supportId, userId, content);
});

function fetchPosts() {
    fetch('/user_stories/')
        .then(response => response.json())
        .then(posts => {
            const container = document.getElementById('postsContainer');
            container.innerHTML = ''; // Clear previous content
            posts.forEach(post => {
                const postElement = document.createElement('div');
                postElement.innerHTML = `
                    <h3>Post ID: ${post.id}</h3>
                    <p>Content: ${post.content}</p>
                    <button onclick="deletePost(${post.id})">Delete</button>
                    <button onclick="showAddComment(${post.id})">Add Comment</button>
                    `;
                container.appendChild(postElement);
            });
        });
}

function addPost(supportId, userId, content) {
    const postData = { supportId, userId, content };
    fetch('/user_stories/', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(postData)
    }).then(response => {
        if (response.ok) {
            alert('Post added');
            fetchPosts();
        }
    });
}

function deletePost(postId) {
    fetch(`/user_stories/${postId}`, { method: 'DELETE' })
        .then(response => {
            if (response.ok) {
                alert('Post deleted');
                fetchPosts();
            }
        });
}

document.getElementById('addCommentForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const postId = document.getElementById('postIdForComment').value;
    const commentContent = document.getElementById('commentContent').value;
    addComment(postId, commentContent);
});

function showAddComment(postId) {
    document.getElementById('postIdForComment').value = postId;
    document.getElementById('addCommentSection').style.display = 'block';
}

function addComment(postId, content) {
    const commentData = { content };
    fetch(`/user_stories/${postId}/comments`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(commentData)
    }).then(response => {
        if (response.ok) {
            alert('Comment added');
            fetchPosts();
            document.getElementById('addCommentSection').style.display = 'none';
        }
    });
}

function deleteComment(commentId) {
    fetch(`/user_stories/comments/${commentId}`, { method: 'DELETE' })
        .then(response => {
            if (response.ok) {
                alert('Comment deleted');
                fetchPosts();
            }
        });
}
