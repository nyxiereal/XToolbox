class Asset {
  final String id;
  final String name;
  final String description;
  final String category;
  final String icon;
  final String author;
  final String homepage;
  final List<InstallMethod> installMethods;

  Asset({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    required this.author,
    required this.homepage,
    required this.installMethods,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      icon: json['icon'] as String,
      author: json['author'] as String,
      homepage: json['homepage'] as String,
      installMethods: (json['install_methods'] as List)
          .map((e) => InstallMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'icon': icon,
      'author': author,
      'homepage': homepage,
      'install_methods': installMethods.map((e) => e.toJson()).toList(),
    };
  }
}

enum InstallType {
  directDownload,
  winget,
  chocolatey,
  scoop,
  microsoftStore;

  static InstallType fromString(String type) {
    switch (type) {
      case 'direct_download':
        return InstallType.directDownload;
      case 'winget':
        return InstallType.winget;
      case 'chocolatey':
        return InstallType.chocolatey;
      case 'scoop':
        return InstallType.scoop;
      case 'microsoft_store':
        return InstallType.microsoftStore;
      default:
        return InstallType.directDownload;
    }
  }

  String get displayName {
    switch (this) {
      case InstallType.directDownload:
        return 'Direct Download';
      case InstallType.winget:
        return 'Winget';
      case InstallType.chocolatey:
        return 'Chocolatey';
      case InstallType.scoop:
        return 'Scoop';
      case InstallType.microsoftStore:
        return 'Microsoft Store';
    }
  }
}

class InstallMethod {
  final InstallType type;
  final String label;
  final String? url;
  final String? filename;
  final bool needsExtraction;
  final String? executablePath;
  final String? packageId;
  final String? storeId;

  InstallMethod({
    required this.type,
    required this.label,
    this.url,
    this.filename,
    this.needsExtraction = false,
    this.executablePath,
    this.packageId,
    this.storeId,
  });

  factory InstallMethod.fromJson(Map<String, dynamic> json) {
    return InstallMethod(
      type: InstallType.fromString(json['type'] as String),
      label: json['label'] as String,
      url: json['url'] as String?,
      filename: json['filename'] as String?,
      needsExtraction: json['needs_extraction'] as bool? ?? false,
      executablePath: json['executable_path'] as String?,
      packageId: json['package_id'] as String?,
      storeId: json['store_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'label': label,
      if (url != null) 'url': url,
      if (filename != null) 'filename': filename,
      if (needsExtraction) 'needs_extraction': needsExtraction,
      if (executablePath != null) 'executable_path': executablePath,
      if (packageId != null) 'package_id': packageId,
      if (storeId != null) 'store_id': storeId,
    };
  }
}
