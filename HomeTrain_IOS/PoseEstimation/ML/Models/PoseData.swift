// Copyright 2021 The TensorFlow Authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// =============================================================================
//

import UIKit

// MARK: Detection result
/// Time required to run pose estimation on one frame.
struct Times {
  var preprocessing: TimeInterval
  var inference: TimeInterval
  var postprocessing: TimeInterval
  var total: TimeInterval { preprocessing + inference + postprocessing }
}

/// An enum describing a body part (e.g. nose, left eye etc.).
enum BodyPart: String, CaseIterable {
  case nose = "nose" //0
  case leftEye = "left eye" //1
  case rightEye = "right eye" //2
  case leftEar = "left ear" //3
  case rightEar = "right ear" //4
  case leftShoulder = "left shoulder" //5
  case rightShoulder = "right shoulder" //6
  case leftElbow = "left elbow" //7
  case rightElbow = "right elbow" //8
  case leftWrist = "left wrist" //9
  case rightWrist = "right wrist" //10
  case leftHip = "left hip" //11
  case rightHip = "right hip" //12
  case leftKnee = "left knee" //13
  case rightKnee = "right knee" //14
  case leftAnkle = "left ankle" //15
  case rightAnkle = "right ankle" //16

  /// Get the index of the body part in the array returned by pose estimation models.
  var position: Int {
    return BodyPart.allCases.firstIndex(of: self) ?? 0
  }
}

/// A body keypoint (e.g. nose) 's detection result.
struct KeyPoint {
  var bodyPart: BodyPart = .nose
  var coordinate: CGPoint = .zero
  var score: Float32 = 0.0
}

/// A person detected by a pose estimation model.
struct Person {
  var keyPoints: [KeyPoint]
  var score: Float32
}
