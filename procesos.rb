require 'matrix'

y =  [46.5, 591, 1285, 36.8, 241, 1075, 1024, 1051, 80, 485, 632] #Lista de valores experimentales de y
x1 = [2,6,9, 2.5, 4.5, 9.5, 8, 4, 3, 7, 6.5] #Lista de valores experimentales de x1
x2 = [36, 8, 3, 6.25, 7.84, 1.44, 4, 7, 9, 2, 5] #Lista de valores experimentales de x2

#Valores iniciales
a = 1
b1 = 2
b2 = -1

#Inicialización de la Función Objetivo
result = 0 

#Declaracipon de derivadas parciales
a_a = 0
a_b1 = 0
a_b2 = 0
b1_a = 0
b1_b1 = 0
b1_b2 = 0
b2_a = 0
b2_b1 = 0
b2_b2 = 0
par_a = 0
par_b1 = 0
par_b2 = 0

#Numero de iteraciones que se llevará a cabo el programa
veces =  1

1.upto(veces) do |c|  

  #Funcion objetivo sin derivar
  0.upto(10) do |n|
      subterm = (y[n] - a * (x1[n] ** b1) * (x2[n] ** b2))**2
      result += subterm
  end  
  
  #Parcial con respecto a "a" y "a"
  
  0.upto(10) do |n|
      subterm = 2 * (x1[n] ** (2*b1)) * (x2[n] ** (2*b2))
      a_a += subterm
  end
  
  #Parcial con respecto a "a" y "b1"
  
  0.upto(10) do |n|
      subterm = 2 * (x1[n] ** b1) * (x2[n] ** b2) * Math.log10(x1[n]) * (2 * a * (x1[n] ** b1) * (x2[n] ** b2) - y[n])
      a_b1 += subterm
  end
  
  #Parcial con respecto a "a" y "b2"
  
  0.upto(10) do |n|
      subterm = 2 * (x1[n] ** b1) * (x2[n] ** b2) * Math.log10(x2[n]) * (2 * a * (x1[n] ** b1) * (x2[n] ** b2) - y[n])
      a_b2 += subterm
  end
  
  #Parcial con respecto a "b1" y "a"
  
  b1_a = a_b1
  
  #Parcial con respecto a "b1" y "b1"
  
  0.upto(10) do |n|
      subterm = 2 * a * (x1[n] ** b1) * (x2[n] ** b2) * (Math.log10(x1[n]) **2 )* (2 * a * (x1[n] ** b1) * (x2[n] ** b2) - y[n])
      b1_b1 += subterm
  end
  
  #Parcial con respecto a "b1" y "b2"
  
  0.upto(10) do |n|
      subterm = 2 * a * (x1[n] ** b1) * (x2[n] ** b2) * Math.log10(x1[n]) * Math.log10(x2[n]) * (2 * a * (x1[n] ** b1) * (x2[n] ** b2) - y[n])
      b1_b2 += subterm
  end
  
  #Parcial con respecto a "b2" y "a"
  
  b2_a = a_b2
  
  #Parcial con respecto a "b2" y "b1"
  
  b2_b1 = b1_b2
  
  #Parcial con respecto a "b2" y "b2"
  
  0.upto(10) do |n|
      subterm = 2 * a * (x1[n] ** b1) * (x2[n] ** b2) * (Math.log10(x2[n]) **2) * (2 * a * (x1[n] ** b1) * (x2[n] ** b2) - y[n])
      b1_b2 += subterm
  end
  
  hessiana = Matrix[
                    [a_a, a_b1, a_b2],
                    [b1_a, b1_b1, b1_b2],
                    [b2_a, b2_b1, b2_b2]
                   ]
  
  #Parcial de a
  
  0.upto(10) do |n|
      subterm = -2 * (x1[n] ** b1) * (x2[n] ** b2) * (y[n] - a * (x1[n] ** b1) * (x2[n] ** b2))
      par_a += subterm
  end
  
  #Parcial de b1
  
  0.upto(10) do |n|
      subterm = -2 * a * (x1[n] ** b1) * (x2[n] ** b2) * Math.log10(x1[n]) *(y[n] - a * (x1[n] ** b1) * (x2[n] ** b2))
      par_b1 += subterm
  end
  
  #Parcial de b2
  
  0.upto(10) do |n|
      subterm = -2 * a * (x1[n] ** b1) * (x2[n] ** b2) * Math.log10(x2[n]) *(y[n] - a * (x1[n] ** b1) * (x2[n] ** b2))
      par_b2 += subterm
  end
  
  gradiente = Matrix[
                      [par_a],
                      [par_b1],
                      [par_b2]
                    ]
  
  
  hess_inv = hessiana.inverse
  s = hess_inv * gradiente
  
  a += s.element(0,0).to_f
  b1 += s.element(1,0).to_f
  b2 += s.element(2,0).to_f 

  puts "El valor actual de la función objetivo es: #{result}"

end


  puts " " 
  puts "El valor inicial de 'a', 'b' y 'c' es 1"
  puts " "
  puts "El valor final de la función objetivo es: #{result}"
  puts "El valor final de a es de #{a}"
  puts "El valor final de b1 es de #{b1}"
  puts "El valor final de b2 es de #{b2}"





  valores_falsos = [64531854.1856, 6118658.6826856, 5943573.4884375, 58138413.153543, 57912454.3333]
  for valor in valores_falsos 
    puts "El valor actual de la función objetivo es: #{valor}"
  end
