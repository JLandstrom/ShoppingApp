
class ServiceLocator{
  static Map<Type, Object> services = new Map();

  static void register<T>(T object){
    if(services.containsKey(T))
      throw Exception("Type $T already registered");
    services[T] = object;
  }

  static T resolve<T>(){
    if(services.containsKey(T))
      return services[T];
    return null;
  }
}