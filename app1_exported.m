classdef app1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        imageAx            matlab.ui.control.UIAxes
        FrameSpinnerLabel  matlab.ui.control.Label
        FrameSpinner       matlab.ui.control.Spinner
        DoneButton         matlab.ui.control.Button
        Slider             matlab.ui.control.Slider
        FrameRate          matlab.ui.control.Label
        WritingButton      matlab.ui.control.StateButton
        Lamp               matlab.ui.control.Lamp
        Label_3            matlab.ui.control.Label
        Joint_Num_Field    matlab.ui.control.NumericEditField
        Label_2            matlab.ui.control.Label
        Frame_Step_Field   matlab.ui.control.NumericEditField
    end

    
    properties (Access = private)
    end
    
    properties (Access = public)
        vidObj % Description]
        cdata
        TotalFrame
        id_image
        SizeImage_V
        SizeImage_H
    end
    
    methods (Access = public)
        
        function setImage(app, value)
            changedValue = round(value);
            app.Slider.Value =  changedValue;
            app.FrameSpinner.Value = changedValue;
            
            app.Lamp.Color = [1.00,0.00,0.00];
            
            time_frame = round(changedValue);
            app.vidObj.CurrentTime = 1/app.vidObj.FrameRate*(time_frame);
            
%             cdata_tmp = readFrame(app.vidObj);
%             EnhanceImage = 1;
%             app.cdata = uint8(EnhanceImage * cdata_tmp);
            
            app.cdata = readFrame(app.vidObj);

            app.id_image.CData = app.cdata;
            drawnow
            
%             app.imageState.Text = "loaded";
            app.Lamp.Color = [0.00,1.00,0.00];
            
%             if app.WritingButton.Value
%                 for ii = 1:app.Joint_Num_Field.Value
%                     
%                 end
%             end
            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, filename, pathname)
            app.vidObj = VideoReader(strcat(pathname,filename));
            app.vidObj.CurrentTime = 0;
            app.cdata = readFrame(app.vidObj);
            
            app.FrameRate.Text = strcat("FrameRate:",num2str(app.vidObj.FrameRate));
            
            app.TotalFrame = round(app.vidObj.Duration*app.vidObj.FrameRate);
            
            app.id_image = image(app.imageAx, app.cdata);
            
            app.SizeImage_V=length(app.cdata(:,1,1));
            app.SizeImage_H=length(app.cdata(1,:,1));
            
            pbaspect(app.imageAx, [app.SizeImage_H, app.SizeImage_V, 1])
            
            xlim(app.imageAx, [0, app.SizeImage_H])
            ylim(app.imageAx, [0, app.SizeImage_V])
            
            app.Slider.Limits = [0, app.TotalFrame];
        end

        % Value changed function: Slider
        function SliderValueChanged(app, event)
            setImage(app, event.Value)
        end

        % Value changed function: FrameSpinner
        function FrameSpinnerValueChanged(app, event)
            setImage(app, event.Value)
        end

        % Window button down function: UIFigure
        function UIFigureWindowButtonDown(app, event)
            fprintf("clicked")
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 791 860];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.WindowButtonDownFcn = createCallbackFcn(app, @UIFigureWindowButtonDown, true);

            % Create imageAx
            app.imageAx = uiaxes(app.UIFigure);
            title(app.imageAx, 'Image')
            xlabel(app.imageAx, 'X')
            ylabel(app.imageAx, 'Y')
            app.imageAx.PlotBoxAspectRatio = [1 1.76460208223046 1.11709520246986];
            app.imageAx.XLim = [0 1];
            app.imageAx.YLim = [0 1];
            app.imageAx.TitleFontWeight = 'bold';
            app.imageAx.Position = [189 156 433 662];

            % Create FrameSpinnerLabel
            app.FrameSpinnerLabel = uilabel(app.UIFigure);
            app.FrameSpinnerLabel.HorizontalAlignment = 'right';
            app.FrameSpinnerLabel.Position = [130 48 40 22];
            app.FrameSpinnerLabel.Text = 'Frame';

            % Create FrameSpinner
            app.FrameSpinner = uispinner(app.UIFigure);
            app.FrameSpinner.ValueChangedFcn = createCallbackFcn(app, @FrameSpinnerValueChanged, true);
            app.FrameSpinner.Position = [185 48 85 22];

            % Create DoneButton
            app.DoneButton = uibutton(app.UIFigure, 'push');
            app.DoneButton.Position = [577 48 100 22];
            app.DoneButton.Text = 'Done';

            % Create Slider
            app.Slider = uislider(app.UIFigure);
            app.Slider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.Slider.Position = [79 139 652 3];

            % Create FrameRate
            app.FrameRate = uilabel(app.UIFigure);
            app.FrameRate.Position = [130 16 117 22];

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Position = [23 413 162 162];

            % Create WritingButton
            app.WritingButton = uibutton(app.UIFigure, 'state');
            app.WritingButton.Text = 'Writing';
            app.WritingButton.Position = [382 48 100 22];

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.HorizontalAlignment = 'right';
            app.Label_2.Position = [291 16 77 22];
            app.Label_2.Text = 'ÿÿÿÿÿÿ';

            % Create Frame_Step_Field
            app.Frame_Step_Field = uieditfield(app.UIFigure, 'numeric');
            app.Frame_Step_Field.Position = [383 16 100 22];

            % Create Label_3
            app.Label_3 = uilabel(app.UIFigure);
            app.Label_3.HorizontalAlignment = 'right';
            app.Label_3.Position = [522 16 41 22];
            app.Label_3.Text = 'ÿÿÿ';

            % Create Joint_Num_Field
            app.Joint_Num_Field = uieditfield(app.UIFigure, 'numeric');
            app.Joint_Num_Field.Position = [578 16 100 22];
            app.Joint_Num_Field.Value = 4;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_exported(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end