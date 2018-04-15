# Given a matrix with lenght n, write a method that calculates the difference of it's diagonals
# and returns the absolute value

# def diagonalDifference(a)
#   result = 0
#   for i in 0..a.length-1 do
#     result+= a[i][i] - a[i][a.length-1-i]
#   end
#   result = result *-1 if result < 0
#   return result
# end


# Prints out the fractions of the positive, negative and zeros in a given array
# arr = [1,2,3,4,5,0,0,0]
# def plusMinus(arr)
#     positive = 0
#     negative = 0
#     zero = 0
#     for el in arr
#       if el > 0
#         positive +=1
#       elsif el === 0
#         zero+=1
#       else
#         negative+=1
#       end
#     end
#
#     puts (positive.to_f / arr.length.to_f).round(6)
#     puts (negative.to_f / arr.length.to_f).round(6)
#     puts (zero.to_f / arr.length.to_f).round(6)
# end

#Write a program that prints a staircase of size .

# def staircase(n)
#   for i in 0..n-1 do
#     string = ''
#     for x in 0..n-1 do
#       if x >= n-i-1
#         string+= '#'
#       else
#         string+= ' '
#       end
#     end
#     puts string
#   end
# end
