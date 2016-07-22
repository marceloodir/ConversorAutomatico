# coding: utf-8

require 'fileutils'
require 'csv' #abrir csv
require 'brstring' #para transformações maiuscula com caracteres latinos.

EVENTO = 'normal'
EXTENSAO = '.cdr'
LISTA = 'nomes.csv'

array_nomes = CSV.read(LISTA) # return an Array of Arrays

Dir.glob("*.cdr").sort.each do |entry|
  origin = File.basename(entry, File.extname(entry))
  indice = origin.split('-').last.to_i
  #squish corta espaços desnecessários e upcase converte tudo em caixa alta
  novo_nome = array_nomes[indice-1][0].squish.upcase + '-' + EVENTO + EXTENSAO
  puts 'copiando '+ entry +' para '+ novo_nome
  FileUtils.cp entry, novo_nome
end
