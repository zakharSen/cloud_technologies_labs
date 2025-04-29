module "authors_table" {
    source = "./modules/dynamodb"
    context = module.label.context
    name = "authors"
}

module "courses_table" {
  source = "./modules/dynamodb"
  context = module.label.context
  name = "courses"
}

module "lambda_function" {
  source = "./modules/lambda"
  context = module.label.context
  courses_table     = module.courses_table.id
  authors_table     = module.authors_table.id
  courses_table_arn = module.courses_table.arn
  authors_table_arn = module.authors_table.arn
}
