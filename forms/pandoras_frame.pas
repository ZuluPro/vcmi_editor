{ This file is a part of Map editor for VCMI project

  Copyright (C) 2015 Alexander Shishkin alexvins@users.sourceforge,net

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
}

unit pandoras_frame;

{$I compilersetup.inc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, 
    base_object_options_frame, object_options;

type

  { TPandorasFrame }

  TPandorasFrame = class(TBaseObjectOptionsFrame)
    edMessage: TMemo;
    Label1: TLabel;
  private
    FOptions: TPandorasOptions;
  public
    procedure VisitPandorasBox(AOptions: TPandorasOptions); override;
    procedure Commit; override;
  end;

implementation

{$R *.lfm}

{ TPandorasFrame }

procedure TPandorasFrame.VisitPandorasBox(AOptions: TPandorasOptions);
begin
  inherited VisitPandorasBox(AOptions);

  FOptions := AOptions;

  edMessage.Text:=AOptions.GuardMessage;
end;

procedure TPandorasFrame.Commit;
begin
  inherited Commit;
  FOptions.GuardMessage:=edMessage.Text;
end;

end.

