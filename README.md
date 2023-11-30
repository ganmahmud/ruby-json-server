# JSON Server in Rails

This is a simple JSON server implemented in Ruby on Rails for creating a fake API based on a JSON file.

## Getting Started

### Prerequisites

- Ruby
- Rails

### Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd json-server-rails

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Start the server:
    
    ```bash
    rails server
    ```

## Usage
### Endpoints
```
GET /:resource: Retrieve all items of a specific resource.
GET /:resource/:id: Retrieve a specific item by ID.
POST /:resource: Create a new item for a specific resource.
PATCH /:resource/:id: Update a specific item by ID.
DELETE /:resource/:id: Delete a specific item by ID.
```

## Example
Assuming we have the following JSON data structure:

```json
{
  "posts": [
    { "id": 1, "title": "First Post", "author": "Alice" },
    { "id": 2, "title": "Second Post", "author": "Bob" },
    { "id": 3, "title": "Third Post", "author": "Charlie" }
  ],
  "comments": [
    { "id": 1, "body": "Great post!", "postId": 1 },
    { "id": 2, "body": "Interesting read.", "postId": 1 },
    { "id": 3, "body": "Looking forward to more.", "postId": 2 }
  ],
  "profile": { "name": "Json Server", "version": "1.0" }
}
```
There are the list endpoints, you can try immediately -

```
POSTS
GET http://localhost:3000/posts
GET /posts/<id>
POST /posts
PUT /posts
DELETE /posts

COMMENTS
GET http://localhost:3000/comments
GET /comments/<id>
POST /comments
PUT /comments
DELETE /comments

PROFILE
GET http://localhost:3000/profile
GET /profile/<id>
POST /profile
PUT /profile
DELETE /profile
```

## Future Plans / Roadmap

This section outlines the upcoming features and improvements planned for this project. Feel free to contribute, suggest ideas, or work on any of these tasks. Check the boxes as items are completed.

- [ ] **Finding Records by Specific Field Value**: Implement the ability to find records by a specific field value.

- [ ] **Limit and Skip**: Add support for limiting and skipping records for paginated results.

- [ ] **Sorting**: Enable the sorting of records based on specific fields.

- [ ] **Group By**: Implement grouping of records based on a particular field.

- [ ] **Gem Release**: Package the project as a Ruby gem for easier integration



