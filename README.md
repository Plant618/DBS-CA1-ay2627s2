# Online Shopping Application – ST0525 CA1

## 1. Project Overview

This project is an online shopping web application developed for the ST0525 Database Systems CA1 assignment.

The application allows users to browse products, manage product reviews and comments, and interact with an online shopping system. It also includes an administrator dashboard for viewing and analysing sales order data.

## 2. Features

### Customer Features
- Browse and view available products.
- Create product reviews for products that have been ordered and completed.
- View all personal reviews.
- Update existing reviews.
- Delete personal reviews.
- Add comments to other members' reviews.
- Reply to existing comments.
- Delete personal comments.

### Administrator Features
- Access the administrator dashboard.
- View summarised sales order information.
- Filter sales data based on selected attributes.
- Sort and analyse sales information.
- View aggregated data and statistics.
- Export sales order summaries as CSV.

## 3. Technologies Used

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Node.js, Express.js
- **Database:** PostgreSQL
- **Database Management:** pgAdmin 4
- **Version Control:** Git and GitHub

## 4. Prerequisites

Before running the application, ensure that the following are installed:

- Node.js
- npm (Node Package Manager)
- PostgreSQL
- pgAdmin 4
- Git

## 5. Installation and Setup

### Step 1: Clone the Repository

```bash
git clone <your-github-repository-url>
```

Navigate into the project folder:

```bash
cd <project-folder>
```

### Step 2: Install Dependencies

Run the following command:

```bash
npm install
```

### Step 3: Set Up the Database

1. Open pgAdmin 4.
2. Create or configure the PostgreSQL database.
3. Restore the provided database backup or execute the required SQL scripts.
4. Ensure the database contains the required tables, functions and stored procedures.

### Step 4: Configure Database Connection

Configure the database connection settings according to your local PostgreSQL setup.

Update the relevant configuration or environment variables with your:

```
DB_HOST=localhost
DB_USER=your-username-here
DB_PASSWORD=your-password-here
DB_NAME=ecommerce
DB_PORT=5432

SESSION_SECRET=your-secret-key-here
JWT_EXPIRES_IN=24h
JWT_SECRET=your-secret-key-here

PORT=3000
NODE_ENV=development
```

### Step 5: Start the Application

Run the application using:

```bash
npm run dev 
```

Open your browser and navigate to:

```text
http://localhost:3000
```

## 6. Database Functions and Stored Procedures

The application uses PostgreSQL stored procedures and user-defined functions to handle database operations.

### Review Management
- `create_review`
- `update_review`
- `delete_review`
- `get_reviews`

### Comment Management
- `create_comment`
- `get_comments`
- `delete_comment`

### Administrator Dashboard
- `get_sale_order_summary`

These database functions handle data retrieval, validation, access control and database operations.

## 7. Project Structure

```text
Nodejs App Project Structure
ecommerce/
├── app.js
├── package.json
├── .env
├── config/
│ └── database.js
├── middleware/
│ └── auth.js
├── routes/
│ ├── auth.js
│ ├── products.js
│ ├── reviews.js
│ ├── comments.js
│ └── admin.js
├── controllers/
│ ├── authController.js
│ ├── productController.js
│ ├── reviewController.js
│ ├── commentController.js
│ └── adminController.js
├── models/
│ ├── authModel.js
│ ├── productModel.js
│ ├── reviewModel.js
│ ├── commentModel.js
│ └── adminModel.js
└── public/
├── auth/
│ ├── login/
│ │ ├── index.html
│ │ ├── style.css
│ │ └── script.js
│ └── register/
│ ├── index.html
│ ├── style.css
│ └── script.js
├── product/
│ └── retrieve/
│ ├── index.html
│ ├── style.css
│ └── script.js
├── review/
│ ├── create/
│ │ ├── index.html
│ │ ├── style.css
│ │ └── script.js
│ ├── retrieve/
│ │ all/
│ │ ├── index.html
│ │ ├── style.css
│ │ └── script.js
│ ├── update/
│ │ ├── index.html
│ │ ├── style.css
│ │ └── script.js
│ └── delete/
│ ├── index.html
3-Oct-26
09:00 PMOfficial (Open)
7/9
│ ├── style.css
│ └── script.js
└── admin/
└── dashboard/
└── salesOrderSummary/
├── index.html
├── style.css
└── script.js
```

## 8. Author

**Name:** [Tan Mu Ling]

**Student ID:** 2523398

**Module:** ST0525 Database Systems

**Assignment:** CA1 Individual Assignment
