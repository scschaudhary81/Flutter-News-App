import '../models/category_model.dart';
List<CategoryModel> getCategories(){
  List<CategoryModel> categories = List<CategoryModel>();
  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName="Business";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();

  categoryModel.categoryName="Entertainment";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();

  categoryModel.categoryName="General";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();

  categoryModel.categoryName="Health";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=731&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();

  categoryModel.categoryName="Science";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1507668077129-56e32842fceb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();

  categoryModel.categoryName="Sports";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();

  categoryModel.categoryName="Technology";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);


  return categories;
}