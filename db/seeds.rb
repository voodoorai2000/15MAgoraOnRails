# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

proposers = [["AcampadaSol", "Acampada Sol"]]
proposers.each do |name, full_name|
  proposer = Proposer.find_or_create_by_full_name(full_name)
  proposer.update_attributes!(:name => name)
end


proposals = [
  ["Reforma electoral encaminada a una democracia más representativa y de proporcionalidad real y con el objetivo adicional de desarrollar mecanismos efectivos de participación ciudadana.", "AcampadaSol"],
  ["Lucha contra la corrupción mediante normas orientadas a una total transparencia política.", "AcampadaSol"],
  ["Separación efectiva de los poderes públicos.", "AcampadaSol"],
  ["Creación de mecanismos de control ciudadano para la exigencia efectiva de responsabilidad política.", "AcampadaSol"]]
       
proposals.each do |proposal, proposer|
  Proposal.create!(:title => proposal, :proposer => Proposer.find_by_name(proposer))
end