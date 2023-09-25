using CSV
using DataFrames
using Plots

# Read the iris dataset from the CSV file
iris_data = CSV.File("iris.csv") |> DataFrame

# Prompt the user to select two columns for plotting boundaries
println("Select two columns for plotting boundaries:")
println("1. Sepal Length")
println("2. Sepal Width")
println("3. Petal Length")
println("4. Petal Width")
println("Enter the numbers of the two columns (e.g., 1 2 for Sepal Length and Sepal Width):")

# Read user input for column selection
selected_columns = readline()
selected_columns = split(selected_columns)

# Ensure that exactly two columns are selected
if length(selected_columns) != 2
    println("Please select exactly two columns.")
    exit()
end

# Convert selected column numbers to column names
column_names = ["sepallength", "sepalwidth", "petallength", "petalwidth"]
selected_names = [column_names[parse(Int, col)] for col in selected_columns]

# Separate the data into two classes (Iris-setosa and Iris-versicolor)
setosa = iris_data[iris_data.class .== "Iris-setosa", selected_names]
versicolor = iris_data[iris_data.class .== "Iris-versicolor", selected_names]

# Define a function to calculate the boundary line equation between two classes
function calculate_boundary(class1, class2)
    x1 = class1[:, 1]
    y1 = class1[:, 2]
    x2 = class2[:, 1]
    y2 = class2[:, 2]
    
    # Fit a linear regression model to the data to find the boundary line
    X = hcat(ones(length(x1)), x1)
    coeffs = X \ y1
    
    # Calculate the boundary line
    m = coeffs[2]
    b = coeffs[1]
    
    return (m, b)
end

# Calculate the boundary line between Iris-setosa and Iris-versicolor
boundary_setosa = calculate_boundary(setosa, versicolor)
boundary_versicolor = calculate_boundary(versicolor, setosa)

# Different shapes for data points
setosa_shape = :xcross
versicolor_shape = :dtriangle

# Define x-values for plotting boundary line
x_values = minimum([minimum(setosa[:, 1]), minimum(versicolor[:, 1])]) - 0.5:0.1:maximum([maximum(setosa[:, 1]), maximum(versicolor[:, 1])]) + 0.5

# Plot the data points
plot(xlabel=selected_names[1], ylabel=selected_names[2], title="$(selected_names[1]) vs $(selected_names[2])", legend=:topright)
scatter!(setosa[:, 1], setosa[:, 2], label="Iris-setosa", shape=setosa_shape)
scatter!(versicolor[:, 1], versicolor[:, 2], label="Iris-versicolor", shape=versicolor_shape)

# Plot the boundary line
plot!(x_values, x -> ((boundary_setosa[1] * x + boundary_setosa[2]) + (boundary_versicolor[1] * x + boundary_versicolor[2])) / 2, label="Setosa-Versicolor Boundary", color="red")

# Save the plot as a PNG image
savefig("iris_boundary.png")

# Print a message when the plot is saved
println("Plot successfully saved as 'iris_boundary.png'")