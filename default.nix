{
  pkgs ? import <nixpkgs> { },
}:
{
  rtabmap-custom = pkgs.rtabmap.overrideAttrs (
    {
      propagatedBuildInputs ? [ ],
      ...
    }:
    {
      src = builtins.path {
        name = "rtabmap-source";
        path = ./.;
      };

      propagatedBuildInputs =
        propagatedBuildInputs
        ++ (with pkgs; [
          (pcl.override { vtk = vtkWithQt5; })
          octomap
          qt5.qtbase
        ]);
    }
  );

}
