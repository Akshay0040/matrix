class MatrixesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def multiply
    matrix_a = params[:matrix_a]
    matrix_b = params[:matrix_b]

    result = multiply_matrices(matrix_a, matrix_b)

    render json: { result: result }
  end

  private

  def multiply_matrices(matrix_a, matrix_b)
    result = matrix_a.map do |row_a|
      row_a.each_with_index.map do |element_a, col_index|
        matrix_b_column = matrix_b.map { |row_b| row_b[col_index] }
        matrix_b_column.sum { |element_b| element_a * element_b }
      end
    end

    result
  end
end
