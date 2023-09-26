using CSV
using DataFrames
using Plots

iris_data = CSV.File("iris.csv") |> DataFrame

println("Select two columns for plotting boundaries:")
println("1. Sepal Length")
println("2. Sepal Width")
println("3. Petal Length")
println("4. Petal Width")
println("Enter the numbers of the two columns (e.g., 1 2 for Sepal Length and Sepal Width):")

selected_columns = readline()
selected_columns = split(selected_columns)

if length(selected_columns) != 2
    println("Please select exactly two columns.")
    exit()
end

column_names = ["sepallength", "sepalwidth", "petallength", "petalwidth"]
selected_names = [column_names[parse(Int, col)] for col in selected_columns]

setosa = iris_data[iris_data.class .== "Iris-setosa", selected_names]
versicolor = iris_data[iris_data.class .== "Iris-versicolor", selected_names]

function calculate_boundary(class1, class2)
    x1 = class1[:, 1]
    y1 = class1[:, 2]
    x2 = class2[:, 1]
    y2 = class2[:, 2]

    X = hcat(ones(length(x1)), x1)
    coeffs = X \ y1

    m = coeffs[2]
    b = coeffs[1]
    
    return (m, b)
end

boundary_setosa = calculate_boundary(setosa, versicolor)
boundary_versicolor = calculate_boundary(versicolor, setosa)

x_values = minimum([minimum(setosa[:, 1]), minimum(versicolor[:, 1])]) - 0.5:0.1:maximum([maximum(setosa[:, 1]), maximum(versicolor[:, 1])]) + 0.5

plot(xlabel=selected_names[1], ylabel=selected_names[2], title="$(selected_names[1]) vs $(selected_names[2])", legend=:topright, background=:black, size=(960, 720))
scatter!(setosa[:, 1], setosa[:, 2], label="Iris-setosa", shape=:xcross)
scatter!(versicolor[:, 1], versicolor[:, 2], label="Iris-versicolor", shape=:dtriangle)

plot!(x_values, x -> ((boundary_setosa[1] * x + boundary_setosa[2]) + (boundary_versicolor[1] * x + boundary_versicolor[2])) / 2, label="Setosa-Versicolor Boundary", color="red")

savefig("iris_boundary.png")

println("Plot successfully saved as 'iris_boundary.png'")