//
//  constant.swift
//  woofle
//
//  Created by Riyan Pahuja on 11/6/2024.
//

import Foundation


    // JSON string
let _jsonString = """
{
    "levels": [
        {
            "level": 1,
            "task": "Water Familiarisation",
            "options": [
                {"brief": "Splash face", "description": "Splash water on your face to get used to the feeling."},
                {"brief": "Hold breath", "description": "Practice holding your breath underwater."},
                {"brief": "Arm movements", "description": "Stand in shallow water and practice gentle arm movements."},
                {"brief": "Blow bubbles", "description": "Practice blowing bubbles in the water."},
                {"brief": "Float on back", "description": "Lie on your back and float with the help of a floatation device."},
                {"brief": "Submerge ears", "description": "Submerge your ears in water to get accustomed to the sound."},
                {"brief": "Walk in shallow", "description": "Walk around in the shallow end to feel the water resistance."},
                {"brief": "Kick legs", "description": "Gently kick your legs while holding onto the pool edge."},
                {"brief": "Face in water", "description": "Hold your breath and put your face in the water for a few seconds."}
            ]
        },
        {
            "level": 2,
            "task": "Breath Control",
            "options": [
                {"brief": "Breathe practice", "description": "Practice breathing in through your mouth and out through your nose in the water."},
                {"brief": "Submerge head", "description": "Submerge your head and exhale through your nose."},
                {"brief": "Rhythmic breathing", "description": "Practice rhythmic breathing by turning your head to the side while floating."},
                {"brief": "Blow bubbles", "description": "Blow bubbles underwater while keeping your head submerged."},
                {"brief": "Hold and bubble", "description": "Alternate between holding your breath and blowing bubbles."},
                {"brief": "Kickboard breathing", "description": "Use a kickboard and focus on breathing techniques."},
                {"brief": "Forceful exhale", "description": "Practice exhaling forcefully underwater to clear your airway."},
                {"brief": "Inhale/exhale slowly", "description": "Inhale deeply and exhale slowly while underwater."},
                {"brief": "Land breathing", "description": "Try breathing exercises on land to control your breath."}
            ]
        },
        {
            "level": 3,
            "task": "Buoyancy and Floating",
            "options": [
                {"brief": "Float on back", "description": "Lie on your back and float without assistance."},
                {"brief": "Float on stomach", "description": "Practice floating on your stomach with your arms outstretched."},
                {"brief": "Float with device", "description": "Use a floatation device to practice floating in a prone position."},
                {"brief": "Back float kick", "description": "Float on your back while gently kicking your legs."},
                {"brief": "Starfish float", "description": "Try starfish float by spreading arms and legs wide."},
                {"brief": "Flip float", "description": "Practice flipping from front to back while floating."},
                {"brief": "Noodle float", "description": "Use a noodle for buoyancy and practice floating."},
                {"brief": "Face down float", "description": "Float face down and then lift your head for breath."},
                {"brief": "Position practice", "description": "Experiment with different floating positions to understand buoyancy."}
            ]
        },
        {
            "level": 4,
            "task": "Kicking Techniques",
            "options": [
                {"brief": "Flutter kicks", "description": "Practice flutter kicks while holding onto the pool edge."},
                {"brief": "Kickboard kicks", "description": "Use a kickboard and practice kicking with a straight leg."},
                {"brief": "Frog kicks", "description": "Try frog kicks in a standing position in shallow water."},
                {"brief": "Quick kicks", "description": "Focus on small, quick kicks to maintain buoyancy."},
                {"brief": "Alternate kicks", "description": "Alternate between flutter and frog kicks."},
                {"brief": "Back float kicks", "description": "Practice kicking while floating on your back."},
                {"brief": "Straight kicks", "description": "Kick with a focus on keeping legs straight and relaxed."},
                {"brief": "Rhythm kicks", "description": "Experiment with different kick speeds to find a comfortable rhythm."},
                {"brief": "Fin kicks", "description": "Use fins to enhance your kicking practice."}
            ]
        },
        {
            "level": 5,
            "task": "Arm Movements",
            "options": [
                {"brief": "Freestyle arms", "description": "Practice freestyle arm strokes while standing in shallow water."},
                {"brief": "Backstroke arms", "description": "Try backstroke arm movements while floating."},
                {"brief": "Kickboard arms", "description": "Use a kickboard and focus on arm strokes only."},
                {"brief": "Sculling", "description": "Perform sculling motions with your hands to move forward."},
                {"brief": "Breaststroke arms", "description": "Practice breaststroke arm movements while standing."},
                {"brief": "Combine arms and kicks", "description": "Combine arm strokes with gentle kicking."},
                {"brief": "Arm experiment", "description": "Experiment with different arm movements to find a comfortable technique."},
                {"brief": "Paddle arms", "description": "Use paddles to practice and enhance your arm strokes."},
                {"brief": "Underwater sweeps", "description": "Try underwater arm sweeps to understand resistance."}
            ]
        },
        {
            "level": 6,
            "task": "Basic Swimming Strokes",
            "options": [
                {"brief": "Freestyle", "description": "Practice the freestyle stroke in shallow water."},
                {"brief": "Backstroke", "description": "Try the backstroke in a supported position."},
                {"brief": "Breaststroke", "description": "Experiment with the breaststroke in shallow water."},
                {"brief": "Freestyle coordination", "description": "Focus on coordinating arms and legs in the freestyle stroke."},
                {"brief": "Elementary backstroke", "description": "Perform the elementary backstroke with simple arm and leg movements."},
                {"brief": "Sidestroke", "description": "Try the sidestroke for a different swimming experience."},
                {"brief": "Underwater stroke", "description": "Practice underwater swimming to understand basic stroke mechanics."},
                {"brief": "Kickboard stroke", "description": "Use a kickboard to practice strokes with minimal resistance."},
                {"brief": "Short distance strokes", "description": "Try short distances to build confidence in different strokes."}
            ]
        },
        {
            "level": 7,
            "task": "Breathing with Strokes",
            "options": [
                {"brief": "Freestyle breathing", "description": "Practice rhythmic breathing with the freestyle stroke."},
                {"brief": "Backstroke breathing", "description": "Coordinate breathing with arm movements in the backstroke."},
                {"brief": "Breaststroke breathing", "description": "Experiment with breathing patterns in the breaststroke."},
                {"brief": "Snorkel stroke", "description": "Use a snorkel to focus on stroke mechanics without worrying about breath."},
                {"brief": "Alternate breathing", "description": "Alternate breathing sides in the freestyle stroke."},
                {"brief": "Exhale and turn", "description": "Focus on exhaling underwater and turning for breath efficiently."},
                {"brief": "Breathing drills", "description": "Practice breathing drills with a kickboard."},
                {"brief": "Breathing rhythm", "description": "Try breathing every two or three strokes to find a comfortable rhythm."},
                {"brief": "Breath control", "description": "Experiment with holding your breath to understand breath control."}
            ]
        },
        {
            "level": 8,
            "task": "Stroke Refinement",
            "options": [
                {"brief": "Freestyle smoothness", "description": "Focus on smooth, controlled arm movements in the freestyle."},
                {"brief": "Backstroke position", "description": "Work on maintaining a straight body position in the backstroke."},
                {"brief": "Breaststroke refinement", "description": "Refine your breaststroke kick to reduce drag."},
                {"brief": "Sidestroke rhythm", "description": "Practice a consistent rhythm in the sidestroke."},
                {"brief": "Freestyle hand position", "description": "Experiment with different hand positions in the freestyle stroke."},
                {"brief": "Stroke reach", "description": "Work on extending your reach in each stroke for better propulsion."},
                {"brief": "Backstroke turn", "description": "Practice turning efficiently in the backstroke."},
                {"brief": "Resistance bands", "description": "Use resistance bands to enhance stroke power."},
                {"brief": "Streamlined position", "description": "Focus on maintaining a streamlined body position in all strokes."}
        ]
    },
    {
        "level": 9,
        "task": "Swimming Endurance",
        "options": [
            {"brief": "Short swims", "description": "Practice swimming short distances with rest breaks."},
            {"brief": "Increase distance", "description": "Gradually increase distance to build endurance."},
            {"brief": "Interval training", "description": "Try interval training with varying speeds."},
            {"brief": "Continuous laps", "description": "Swim continuous laps to build stamina."},
            {"brief": "Steady pace", "description": "Focus on maintaining a steady pace over longer distances."},
            {"brief": "Varied strokes", "description": "Experiment with different strokes to build overall endurance."},
            {"brief": "Fin resistance", "description": "Use fins to add resistance and build strength."},
            {"brief": "Breathing for endurance", "description": "Practice breathing techniques to manage fatigue."},
            {"brief": "Sprint practice", "description": "Incorporate sprints into your routine to improve endurance."}
        ]
    },
    {
        "level": 10,
        "task": "Confident Swimming",
        "options": [
            {"brief": "Continuous swim", "description": "Swim continuously for a set distance without stopping."},
            {"brief": "Varied conditions", "description": "Practice swimming in different water conditions."},
            {"brief": "Underwater swim", "description": "Experiment with swimming underwater for short distances."},
            {"brief": "Deep water practice", "description": "Try swimming in deeper water to build confidence."},
            {"brief": "Stroke efficiency", "description": "Focus on refining all strokes for efficiency."},
            {"brief": "Different environments", "description": "Practice swimming in a variety of environments, such as lakes or the ocean."},
            {"brief": "All techniques", "description": "Use all learned techniques to swim comfortably and confidently."},
            {"brief": "Regular routine", "description": "Incorporate swimming into your regular fitness routine."},
            {"brief": "New goals", "description": "Challenge yourself with new swimming goals, such as mastering a new stroke."}
        ]
    }
]
}
"""
