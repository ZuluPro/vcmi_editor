unit object_link_frame;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, StdCtrls, map,
  object_options;

type

  { TObjectLinkFrame }

  TObjectLinkFrame = class(TFrame)
    ObjectList: TListBox;
  private
    FMap: TVCMIMap;
    procedure SetMap(AValue: TVCMIMap);
  public
    procedure Commit;
    procedure Load(AIdentifier: String);

    property Map: TVCMIMap read FMap write SetMap;
  end;

implementation

uses editor_consts;

{$R *.lfm}

{ TObjectLinkFrame }

procedure TObjectLinkFrame.SetMap(AValue: TVCMIMap);
begin
  if FMap=AValue then Exit;
  FMap:=AValue;
end;

procedure TObjectLinkFrame.Commit;
var
  map_object: TMapObject;
begin
  map_object := (ObjectList.Items.Objects[ObjectList.ItemIndex] as TMapObject);

  //todo: TObjectLinkFrame.Commit
end;

procedure TObjectLinkFrame.Load(AIdentifier: String);
var
  map_object: TMapObject;
  item: TCollectionItem;

  function GetTownName(): AnsiString;
  begin
    if map_object.GetID = 'randomTown' then
    begin
      Result := 'Random town';
    end
    else
    begin
      Result := Map.ListsManager.GetFaction(map_object.GetSubId).Name;
    end;
  end;
begin
  //todo: TObjectLinkFrame.Load

  //FLink := Alink;
  //
  //for item in FMap.Objects do
  //begin
  //  map_object := item as TMapObject;
  //
  //  if (map_object.Options is TMonsterOptions) and (FLink.&type = TYPE_MONSTER) then
  //  begin
  //
  //  end
  //  else if (map_object.Options is THeroOptions) and (FLink.&type = TYPE_HERO) then
  //  begin
  //
  //  end
  //  else if (map_object.Options is TTownOptions) and ((FLink.&type = TYPE_TOWN) or (FLink.&type = TYPE_RANDOMTOWN)) then
  //  begin
  //    ObjectList.AddItem(Format('%s at %d %d %d',[GetTownName, map_object.L, map_object.X, map_object.Y]),map_object);
  //  end
  //  else
  //    Continue;
  //
  //  if (map_object.L = FLink.L) and (map_object.X = FLink.x) and (map_object.Y = FLink.Y) then
  //  begin
  //    ObjectList.ItemIndex := ObjectList.Count-1; //select recently added object
  //  end;
  //
  //end;

  ObjectList.Invalidate;
end;

end.

