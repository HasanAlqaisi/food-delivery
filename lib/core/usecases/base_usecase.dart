abstract class BaseUsecase<Type, Input> {
  Type call(Input params);
}
