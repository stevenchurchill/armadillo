[Mesh]
  type = FileMesh
  file = sphere_medium_exodus.e
  block_id = '1 2'
  block_name = 'medium sphere'
  boundary_id = '1 2 3 4 5 6 7'
  boundary_name = '1 2 3 4 5 6 7'
 
[]

[Variables]
  active = 'PhiM'

  [./PhiM]
    order = FIRST
    family = LAGRANGE
  [../]

[]

[Kernels]

  [./lp]
    type = LaplaceMat
    variable = PhiM
    block = '1'
    mu00 = 2.0
    mu01 = 0
    mu02 = 0
    mu10 = 0
    mu11 = 2.0
    mu12 = 0
    mu20 = 0
    mu21 = 0
    mu22 = 2.0	
  [../]

  [./lp2]
    type = LaplaceMat
    variable = PhiM
    block = '2'
    mu00 = 4.0
    mu01 = 0
    mu02 = 0
    mu10 = 0
    mu11 = 4.0
    mu12 = 0
    mu20 = 0
    mu21 = 0
    mu22 = 4.0	
  [../]
[]

[BCs]
  active = '1 2'
  [./1]
    type = DirichletBC
    variable = PhiM
    boundary = '1'
    value = -1
  [../]

  [./2]
    type = DirichletBC
    variable = PhiM
    boundary = '2'
    value = 1
  [../]

[]

[Executioner]
  type = Steady
  solve_type = 'PJFNK'
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true
[]
