# Microservices Demo: User Professions Suggestions

This is a demonstration of a microservices architecture using Docker Compose with a Prolog microservice. The application consists of two microservices:

1. **ExpressJS User-Facing API:**
- Handles user input validation and preparation.
- Accepts lists of skills and interests from users.
- Provides an API for interacting with the system.

2. **Prolog Service for Profession Suggestions:**
- Internal service generating profession suggestions based on user-supplied skills and interests.
- Utilizes Prolog to process and analyze input data.
- Returns a list of suggested professions for the user.

## Usage

### Prerequisites
- Docker
- Docker Compose
### Running the Application
1. Clone this repository:

```bash
git clone https://github.com/mitryp/prolog_microservice_demo.git
cd microservices-demo
```

2. Build and run the Docker containers:
```bash
docker compose up
```

3. The microservices will be accessible at:
- ExpressJS API: [http://localhost:8000](http://localhost:8000)
- Prolog Service: Accessible internally only by Node within the Docker network.
### API Endpoints
- **Endpoint:** `/advice`
- **Method:** POST
- **Example Request:**
```json
{
    "skills": ["coding", "problem_solving"],
    "interests": ["technology", "innovation"]
}
```
- **Example Response:**
```json
{
    "suggestions": ["engineer", "programmer"]
}
```
---
- **Endpoint:** `/options`
- **Method:** GET
- **Example Response:**
```json
{
    "skills": [
        "analytical_thinking",
        "attention_to_detail"
    ],
    "interests": [
        "advertising",
        "aesthetics"
    ]
}
```
## Additional Notes

- The Prolog service communicates internally within the Docker network.
- This is a demonstration only and is not intended for production use.
## License

This project is licensed under the MIT License.
